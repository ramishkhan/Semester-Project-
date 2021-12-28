import 'package:firebase_auth/firebase_auth.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print("sign up successfully");
      return user;
    } else {
      print("sign up failed");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> login1(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    print('login succcessfull');
    return user;
  } catch (e) {
    print(e);
    return null;
  }
}
