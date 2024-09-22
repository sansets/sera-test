import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sera_test/src/data/models/body/product_body.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';
import 'package:sera_test/src/presentation/product_detail/bloc/product/product_bloc.dart';
import 'package:sera_test/src/presentation/product_detail/cubit/product_detail_state.dart';
import 'package:sera_test/src/util/base/base_cubit.dart';
import 'package:sera_test/src/util/extensions/demo_failure_extension.dart';

class ProductDetailCubit extends BaseCubit<ProductDetailState> {
  ProductDetailCubit({
    required this.productBloc,
  }) : super(const ProductDetailState(
    product: null,
  ));

  final ProductBloc productBloc;

  initData(ProductEntity? product) {
    emit(state.copyWith(product: product));
  }
  
  @override
  void initAfterFirstLayout(BuildContext context) {
    productBloc.add(FetchProduct(ProductBody(id: state.product?.id)));
    super.initAfterFirstLayout(context);
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<ProductBloc>(create: (context) => productBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<ProductBloc, ProductState>(listener: _listenerProduct),
      ];

  @override
  void dispose() {
    productBloc.close();
  }

  void _listenerProduct(BuildContext context, ProductState state) {
    state.when(
      onFailed: (state) {
        debugPrint(state.failure.toString());
        state.failure.showSnackbar(context);
      },
      onSuccess: (state) {
        emit(this.state.copyWith(product: state.data));
      },
    );
  }
}
