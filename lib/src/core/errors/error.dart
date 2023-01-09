import 'package:equatable/equatable.dart';

import '../core.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class NetworkFailure extends Failure {
  final ResponseException responseException;
  NetworkFailure({
    required this.responseException,
  });
  @override
  List<Object> get props => [responseException];
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure({required this.message});
  @override
  List<Object> get props => [message];
}

class PluginFailure extends Failure {
  final String message;

  PluginFailure({required this.message});
  @override
  List<Object> get props => [message];
}
