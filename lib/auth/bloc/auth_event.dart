import 'package:flutter/foundation.dart';

@immutable
abstract class AuthEvent {}

class AuthStateRequest extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);
}
