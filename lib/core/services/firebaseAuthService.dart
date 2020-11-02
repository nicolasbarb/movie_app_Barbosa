import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth createFirebaseAuthInstance() {
    return FirebaseAuth.instance;
  }

  void signInMailandPassword(String email, String pwd) async {
    _auth.signInWithEmailAndPassword(email: email, password: pwd);
  }

  void signOut() async {
    _auth.signOut();
  }

  Stream<User> get user {
    return _auth.authStateChanges();
  }
}