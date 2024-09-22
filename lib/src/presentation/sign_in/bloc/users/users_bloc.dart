
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sera_test/src/data/datasources/network/model/demo_failure.dart';
import 'package:sera_test/src/data/models/body/users_body.dart';
import 'package:sera_test/src/domain/entities/user_entity.dart';
import 'package:sera_test/src/domain/repositories/app_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc
    extends Bloc<UsersEvent, UsersState> {
  final AppRepository repository;

  UsersBloc({
    required this.repository,
  }) : super(UsersInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UsersLoading(event.body, event.extra));
      final result = await repository.users(event.body);
      emit(
        result.fold(
          (failure) =>
              UsersFailed(event.body, failure, event.extra),
          (success) =>
              UsersSuccess(event.body, success, event.extra),
        ),
      );
    });
  }
}