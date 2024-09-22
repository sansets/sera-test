import 'package:sera_test/src/presentation/sign_in/bloc/login/login_bloc.dart';
import 'package:sera_test/src/presentation/sign_in/bloc/users/users_bloc.dart';
import 'package:sera_test/src/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:sera_test/src/util/global_variable.dart';

void setupLocatorSignIn() {
  // *Cubit
  locator.registerFactory(() => SignInCubit(
        usersBloc: locator(),
        loginBloc: locator(),
      ));
  // *Bloc
  locator.registerFactory(() => UsersBloc(repository: locator()));
  locator.registerFactory(() => LoginBloc(repository: locator()));
}
