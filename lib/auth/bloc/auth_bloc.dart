import 'package:bloc/bloc.dart';
import 'package:fit_buddy/auth/data_source/auth_data_source.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthDataSource dataSource;

  AuthBloc({required this.dataSource}) : super(AuthState(authenticated: dataSource.userSignedIn())) {
    on<SignInEvent>((event, emit) => _handleSignIn(event, emit));
  }

  _handleSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    final signedIn = await dataSource.signIn(event.email, event.password);
    emit(AuthState(authenticated: signedIn));
  }
}
