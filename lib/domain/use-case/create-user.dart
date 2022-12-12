import 'package:firebase_auth/firebase_auth.dart';

class FeatureUserUseCase {
  String email = '';
  String password = '';
  dynamic error;

  Future<String> getUser() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('user created SUCCESS');
      print(credential.user!.uid);

      return credential.user!.uid;
    } catch (e) {
      throw {error = e};
    }
  }
}
