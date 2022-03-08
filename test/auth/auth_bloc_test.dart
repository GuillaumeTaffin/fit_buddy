import 'package:bloc_test/bloc_test.dart';
import 'package:fit_buddy/auth/bloc/auth_bloc.dart';
import 'package:fit_buddy/auth/bloc/auth_event.dart';
import 'package:fit_buddy/auth/bloc/auth_state.dart';

import 'fake_auth_data_source.dart';

void main() {
  blocTest(
    'Successful sign in',
    build: () => AuthBloc(dataSource: FakeAuthDataSource(signInSuccess: true)),
    act: (AuthBloc bloc) => bloc.add(SignInEvent('email', 'password')),
    expect: () => [const AuthState(authenticated: true)],
  );

  blocTest(
    'Failure sign in',
    build: () => AuthBloc(dataSource: FakeAuthDataSource(signInSuccess: false)),
    act: (AuthBloc bloc) => bloc.add(SignInEvent('email', 'password')),
    expect: () => [const AuthState(authenticated: false)],
  );
}
