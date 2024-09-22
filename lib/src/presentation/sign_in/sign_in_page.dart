import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sera_test/src/presentation/sign_in/bloc/login/login_bloc.dart';
import 'package:sera_test/src/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:sera_test/src/theme/components/demo_app_bar.dart';
import 'package:sera_test/src/theme/components/demo_button/demo_button.dart';
import 'package:sera_test/src/theme/components/demo_text_field/demo_text_field.dart';
import 'package:sera_test/src/theme/demo_colors.dart';
import 'package:sera_test/src/util/base/base_state_page.dart';
import 'package:sera_test/src/util/extensions/localization_extension.dart';
import 'package:sera_test/src/util/global_variable.dart';
import 'package:sera_test/src/util/helpers/validator_value_helper.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const routeName = '/';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with BaseStatePage<SignInPage, SignInCubit> {
  @override
  SignInCubit setCubit() => locator();

  @override
  Widget buildWidget(BuildContext context) {
    final watchLoginState = context.watch<LoginBloc>().state;
    final usernameKey =
        context.select((SignInCubit element) => element.usernameKey);
    final passwordKey =
        context.select((SignInCubit element) => element.passwordKey);
    final isButtonEnabled = context
        .select((SignInCubit element) => element.state.isLoginButtonEnabled);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: DemoAppBar(
          title: context.s.appTitle,
          isHideBackButton: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                child: Text(
                  context.s.titleWelcomeBackShopper,
                  style: TextStyle(
                    fontSize: 24,
                    color: context.color.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DemoTextField(
                  key: usernameKey,
                  title: context.s.titleUsername,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: context.s.hintInputUsername,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: ValidatorValueHelper.validatorUsername,
                  onChanged: (text) {
                    usernameKey.currentState?.validate(value: text);
                    context.read<SignInCubit>().setValidateUsername();
                  },
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DemoTextField(
                  key: passwordKey,
                  title: context.s.hintInputPassword,
                  isPassword: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: context.s.hintInputPassword,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: ValidatorValueHelper.validatorPassword,
                  onChanged: (text) {
                    passwordKey.currentState?.validate(value: text);
                    context.read<SignInCubit>().setValidatePassword();
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  Container(
                    height: 32,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DemoButton.text(
                      text: context.s.titleAutofill,
                      onPressed: () {
                        context.read<SignInCubit>().setAutofill();
                      },
                      isExpand: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DemoButton.primary(
                  text: context.s.titleLogin,
                  isEnabled: isButtonEnabled,
                  isLoading: watchLoginState is LoginLoading,
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    context.read<SignInCubit>().login();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
