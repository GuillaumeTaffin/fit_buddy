import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthState extends Equatable {
  final bool authenticated;

  const AuthState({required this.authenticated});

  @override
  List<Object?> get props => [authenticated];
}
