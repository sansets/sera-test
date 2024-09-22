import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sera_test/src/data/models/body/login_body.dart';
import 'package:sera_test/src/data/models/body/users_body.dart';
import 'package:sera_test/src/presentation/sign_in/bloc/login/login_bloc.dart';
import 'package:sera_test/src/presentation/sign_in/bloc/users/users_bloc.dart';
import 'package:sera_test/src/presentation/sign_in/cubit/sign_in_state.dart';
import 'package:sera_test/src/theme/components/demo_text_field/demo_text_field.dart';
import 'package:sera_test/src/theme/components/demo_text_field/show_status_message.dart';
import 'package:sera_test/src/theme/components/demo_text_field/validator_value.dart';
import 'package:sera_test/src/util/base/base_cubit.dart';
import 'package:sera_test/src/util/constants/demo_routes.dart';
import 'package:sera_test/src/util/extensions/demo_failure_extension.dart';
import 'package:sera_test/src/util/helpers/secure_storage_helper.dart';

class SignInCubit extends BaseCubit<SignInState> {
  SignInCubit({
    required this.usersBloc,
    required this.loginBloc,
  }) : super(const SignInState(
          users: [],
          isLoginButtonEnabled: false,
        ));

  final UsersBloc usersBloc;
  final LoginBloc loginBloc;

  final usernameKey = GlobalKey<DemoTextFieldState>();
  final passwordKey = GlobalKey<DemoTextFieldState>();

  bool _isUsernameValid = false;
  bool _isPasswordValid = false;

  @override
  void initAfterFirstLayout(BuildContext context) {
    usersBloc.add(FetchUsers(const UsersBody()));
    super.initAfterFirstLayout(context);
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<UsersBloc>(create: (context) => usersBloc),
        BlocProvider<LoginBloc>(create: (context) => loginBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<UsersBloc, UsersState>(listener: _listenerUsers),
        BlocListener<LoginBloc, LoginState>(listener: _listenerLogin),
      ];

  @override
  void dispose() {
    usersBloc.close();
    loginBloc.close();
  }

  void setValidateUsername() {
    usernameKey.currentState?.validatorValue = const ValidatorValue(
      message: "",
      showStatusMessage: ShowStatusMessage.none,
    );

    _isUsernameValid = usernameKey.text.isNotEmpty;
    emit(state.copyWith(isLoginButtonEnabled: _isFieldsValid()));
  }

  void setValidatePassword() {
    passwordKey.currentState?.validatorValue = const ValidatorValue(
      message: "",
      showStatusMessage: ShowStatusMessage.none,
    );

    _isPasswordValid = passwordKey.text.isNotEmpty;
    emit(state.copyWith(isLoginButtonEnabled: _isFieldsValid()));
  }

  bool _isFieldsValid() => _isUsernameValid && _isPasswordValid;
  void _setValidate() {
    usernameKey.validate();
    passwordKey.validate();
  }

  void setAutofill() {
    final user = state.users.firstOrNull;
    usernameKey.text = user?.username ?? "johnd";
    passwordKey.text = user?.password ?? "m38rmF\$";

    setValidateUsername();
    setValidatePassword();
  }

  void login() {
    _setValidate();
    if (_isFieldsValid()) {
      _fetchSignIn(LoginBody(
        username: usernameKey.text,
        password: passwordKey.text,
      ));
    }
  }

  void _fetchSignIn(LoginBody body) {
    loginBloc.add(FetchLogin(body));
  }

  void _listenerUsers(BuildContext context, UsersState state) {
    state.when(
      onFailed: (state) {
        debugPrint(state.failure.toString());
        state.failure.showSnackbar(context);
      },
      onSuccess: (state) async {
        emit(this.state.copyWith(users: state.data));
      },
    );
  }

  void _listenerLogin(BuildContext context, LoginState state) {
    state.when(
      onFailed: (state) {
        debugPrint(state.failure.toString());
        state.failure.showSnackbar(context);
      },
      onSuccess: (state) async {
        final user = this.state.users.firstWhere((e) => e.username == usernameKey.text);

        await SecureStorageHelper.saveToken(state.data.token);
        await SecureStorageHelper.saveUserId(user.id);

        if (context.mounted) {
          context.goToProductList();
        }
      },
    );
  }
}
