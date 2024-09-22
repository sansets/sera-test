
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sera_test/src/data/datasources/network/model/demo_failure.dart';
import 'package:sera_test/src/data/models/body/carts_body.dart';
import 'package:sera_test/src/domain/entities/cart_entity.dart';
import 'package:sera_test/src/domain/repositories/app_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc
    extends Bloc<CartEvent, CartState> {
  final AppRepository repository;

  CartBloc({
    required this.repository,
  }) : super(CartInitial()) {
    on<FetchCart>((event, emit) async {
      emit(CartLoading(event.body, event.extra));
      final result = await repository.carts(event.body);
      emit(
        result.fold(
          (failure) =>
              CartFailed(event.body, failure, event.extra),
          (success) =>
              CartSuccess(event.body, success, event.extra),
        ),
      );
    });
  }
}