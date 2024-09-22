import 'package:sera_test/src/presentation/product_list/bloc/products/products_bloc.dart';
import 'package:sera_test/src/presentation/product_list/cubit/product_list_cubit.dart';
import 'package:sera_test/src/util/global_variable.dart';

void setupLocatorProductList() {
  // *Cubit
  locator.registerFactory(() => ProductListCubit(productsBloc: locator()));
  // *Bloc
  locator.registerFactory(() => ProductsBloc(repository: locator()));
}
