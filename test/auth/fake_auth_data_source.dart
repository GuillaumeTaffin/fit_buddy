import 'package:equatable/equatable.dart';
import 'package:fit_buddy/auth/data_source/auth_data_source.dart';

class FakeAuthDataSource implements AuthDataSource {
  final bool signInSuccess;
  final bool signedIn;

  final List<SignInRecord> signInRecords = [];

  FakeAuthDataSource({this.signInSuccess = true, this.signedIn = true});

  @override
  Future<bool> signIn(String email, String password) async {
    signInRecords.add(SignInRecord(email, password));
    return signInSuccess;
  }

  @override
  bool userSignedIn() {
    return signedIn;
  }
}

class SignInRecord extends Equatable {
  final String email;
  final String password;

  const SignInRecord(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
