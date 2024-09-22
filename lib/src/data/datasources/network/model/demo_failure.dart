import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// The interface for Demo Failure after catch [DemoException].
@immutable
sealed class DemoFailure extends Equatable {
  const DemoFailure(
    this.message, {
    this.statusCode,
    this.jsonBody,
  });
  final String message;
  final int? statusCode;
  final String? jsonBody;

  @override
  List<Object?> get props => [message, statusCode, jsonBody];
}

/// A failure caused by a http error status code 300-399.
final class RedirectionFailure extends DemoFailure {
  const RedirectionFailure(
    super.message, {
    super.statusCode,
    super.jsonBody,
  });
}

/// A failure caused by a http error status code 400-499.
final class ClientFailure extends DemoFailure {
  const ClientFailure(
    super.message, {
    super.statusCode,
    super.jsonBody,
  });
}

/// A failure caused by a http error status code 500-599.
final class ServerFailure extends DemoFailure {
  const ServerFailure(
    super.message, {
    super.statusCode,
    super.jsonBody,
  });
}

/// A failure caused by a http error status code 401.
final class UnauthorizedFailure extends DemoFailure {
  const UnauthorizedFailure(
    super.message, {
    super.statusCode,
    super.jsonBody,
  });
}

/// A failure caused by a http error timeout fetch http client.
final class TimeoutFailure extends DemoFailure {
  const TimeoutFailure(super.message);
}

/// A failure caused by an error in internal app.
final class InternalFailure extends DemoFailure {
  const InternalFailure(super.message);
}

/// A failure caused by a http error status code 300-599 in do refresh token.
final class RefreshTokenFailure extends DemoFailure {
  const RefreshTokenFailure(
    super.message, {
    super.statusCode,
    super.jsonBody,
  });
}

/// A failure caused by an error no internet connection.
final class NoInternetFailure extends DemoFailure {
  const NoInternetFailure(super.message);
}

/// A failure caused by an error no found data in cache.
final class CacheFailure extends DemoFailure {
  const CacheFailure(super.message);
}
