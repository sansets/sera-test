import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sera_test/src/data/models/body/products_body.dart';
import 'package:sera_test/src/presentation/product_list/bloc/products/products_bloc.dart';
import 'package:sera_test/src/presentation/product_list/cubit/product_list_state.dart';
import 'package:sera_test/src/util/base/base_cubit.dart';
import 'package:sera_test/src/util/extensions/demo_failure_extension.dart';

class ProductListCubit extends BaseCubit<ProductListState> {
  ProductListCubit({
    required this.productsBloc,
  }) : super(const ProductListState(
    products: [],
  ));

  final ProductsBloc productsBloc;
  
  @override
  void initAfterFirstLayout(BuildContext context) {
    productsBloc.add(FetchProducts(const ProductsBody()));
    super.initAfterFirstLayout(context);
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<ProductsBloc>(create: (context) => productsBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<ProductsBloc, ProductsState>(listener: _listenerProducts),
      ];

  @override
  void dispose() {
    productsBloc.close();
  }

  void _listenerProducts(BuildContext context, ProductsState state) {
    state.when(
      onFailed: (state) {
        debugPrint(state.failure.toString());
        state.failure.showSnackbar(context);
      },
      onSuccess: (state) {
        emit(this.state.copyWith(products: state.data));
      },
    );
  }
}
