
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sera_test/src/data/datasources/network/model/demo_failure.dart';
import 'package:sera_test/src/data/models/body/product_body.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';
import 'package:sera_test/src/domain/repositories/app_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc
    extends Bloc<ProductEvent, ProductState> {
  final AppRepository repository;

  ProductBloc({
    required this.repository,
  }) : super(ProductInitial()) {
    on<FetchProduct>((event, emit) async {
      emit(ProductLoading(event.body, event.extra));
      final result = await repository.product(event.body);
      emit(
        result.fold(
          (failure) =>
              ProductFailed(event.body, failure, event.extra),
          (success) =>
              ProductSuccess(event.body, success, event.extra),
        ),
      );
    });
  }
}