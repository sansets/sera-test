import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sera_test/src/data/models/body/carts_body.dart';
import 'package:sera_test/src/presentation/carts/bloc/cart/cart_bloc.dart';
import 'package:sera_test/src/presentation/carts/cubit/cart_state.dart' as cart_state_cubit;
import 'package:sera_test/src/util/base/base_cubit.dart';
import 'package:sera_test/src/util/extensions/demo_failure_extension.dart';
import 'package:sera_test/src/util/helpers/secure_storage_helper.dart';

class CartCubit extends BaseCubit<cart_state_cubit.CartState> {
  CartCubit({
    required this.cartBloc,
  }) : super(const cart_state_cubit.CartState(
    cart: null,
  ));

  final CartBloc cartBloc;
  
  @override
  void initAfterFirstLayout(BuildContext context) async {
    final userId = await SecureStorageHelper.getUserId();
    cartBloc.add(FetchCart(CartsBody(userId: userId)));
  }

  @override
  List<BlocProvider> blocProviders(BuildContext context) => [
        BlocProvider<CartBloc>(create: (context) => cartBloc),
      ];

  @override
  List<BlocListener> blocListeners(BuildContext context) => [
        BlocListener<CartBloc, CartState>(listener: _listenerCart),
      ];

  @override
  void dispose() {
    cartBloc.close();
  }

  void _listenerCart(BuildContext context, CartState state) {
    state.when(
      onFailed: (state) {
        debugPrint(state.failure.toString());
        state.failure.showSnackbar(context);
      },
      onSuccess: (state) {
        emit(this.state.copyWith(cart: state.data));
      },
    );
  }
}
