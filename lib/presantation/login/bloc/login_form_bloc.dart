import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../use-case/user-register.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc<dynamic>(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );
  final password = TextFieldBloc<dynamic>(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.passwordMin6Chars
    ],
  );
  final showSuccessResponse = BooleanFieldBloc<dynamic>();
  LoginFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
        showSuccessResponse,
      ],
    );
  }
  @override
  void onSubmitting() async {
    print(email.value);
    print(password.value);
    print(showSuccessResponse.value);
    UserRegister registerUsecase =
        UserRegister(email: email.value, password: password.value);

    try {
      registerUsecase.registerUserUsecase();
      if (registerUsecase.userId != null) {
        emitSuccess();
        print('user uuId $registerUsecase.userId');
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        emitFailure(failureResponse: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emitFailure(
            failureResponse: 'The account already exists for that email.');
      }
    } catch (e) {
      print('catch $e');
      emitFailure(failureResponse: 'This is an unknown  error server!');
    }
    // try {
    //   final credential =
    //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: email.value,
    //     password: password.value,
    //   );
    //   //final String? userId = credential.user?.uid;
    //   print('user created SUCCESS');

    //   print(credential.user!.uid);
    //   if (credential.user!.uid != null) {
    //     emitSuccess();
    //   }
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     emitFailure(failureResponse: 'The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     emitFailure(
    //         failureResponse: 'The account already exists for that email.');
    //   }
    // } catch (e) {
    //   print('catch $e');
    //   emitFailure(failureResponse: 'This is an unknown  error server!');
    // }

    //await Future<void>.delayed(const Duration(seconds: 2));
  }
}
