import 'package:sera_test/src/presentation/product_detail/bloc/product/product_bloc.dart';
import 'package:sera_test/src/presentation/product_detail/cubit/product_detail_cubit.dart';
import 'package:sera_test/src/util/global_variable.dart';

void setupLocatorProductDetail() {
  // *Cubit
  locator.registerFactory(() => ProductDetailCubit(productBloc: locator()));
  // *Bloc
  locator.registerFactory(() => ProductBloc(repository: locator()));
}
