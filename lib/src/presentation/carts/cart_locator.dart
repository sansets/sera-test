import 'package:sera_test/src/presentation/carts/bloc/cart/cart_bloc.dart';
import 'package:sera_test/src/presentation/carts/cubit/cart_cubit.dart';
import 'package:sera_test/src/util/global_variable.dart';

void setupLocatorCart() {
  // *Cubit
  locator.registerFactory(() => CartCubit(cartBloc: locator()));
  // *Bloc
  locator.registerFactory(() => CartBloc(repository: locator()));
}
