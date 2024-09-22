
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sera_test/src/data/datasources/network/model/demo_failure.dart';
import 'package:sera_test/src/data/models/body/products_body.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';
import 'package:sera_test/src/domain/repositories/app_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc
    extends Bloc<ProductsEvent, ProductsState> {
  final AppRepository repository;

  ProductsBloc({
    required this.repository,
  }) : super(ProductsInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductsLoading(event.body, event.extra));
      final result = await repository.products(event.body);
      emit(
        result.fold(
          (failure) =>
              ProductsFailed(event.body, failure, event.extra),
          (success) =>
              ProductsSuccess(event.body, success, event.extra),
        ),
      );
    });
  }
}