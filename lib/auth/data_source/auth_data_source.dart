import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataSource {
  final _auth = Supabase.instance.client.auth;

  Future<bool> signIn(String email, String password) async {
    final response = await _auth.signIn(email: email, password: password);
    if (response.error == null) {
      return true;
    }
    return false;
  }

  bool userSignedIn() {
    return _auth.currentUser != null;
  }
}
