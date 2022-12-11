import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthReq {
  // late final String email;
  // late final String password;
  @override
  Future createUser(String email, String password) async {
    try {
      // final dynamic credential =
      //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      //final String? userId = credential.user?.uid;
      print('user created SUCCESS, $email, $password');
      // print(credential.user!.uid);
    } catch (e) {
      print('catch $e');
    }
  }
}
