
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sera_test/src/data/datasources/network/model/demo_failure.dart';
import 'package:sera_test/src/data/models/body/login_body.dart';
import 'package:sera_test/src/domain/entities/login_entity.dart';
import 'package:sera_test/src/domain/repositories/app_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc
    extends Bloc<LoginEvent, LoginState> {
  final AppRepository repository;

  LoginBloc({
    required this.repository,
  }) : super(LoginInitial()) {
    on<FetchLogin>((event, emit) async {
      emit(LoginLoading(event.body, event.extra));
      final result = await repository.login(event.body);
      emit(
        result.fold(
          (failure) =>
              LoginFailed(event.body, failure, event.extra),
          (success) =>
              LoginSuccess(event.body, success, event.extra),
        ),
      );
    });
  }
}