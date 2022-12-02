import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc<dynamic>(
    validators:
    [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );
  final password = TextFieldBloc<dynamic>(
    validators: [FieldBlocValidators.required, FieldBlocValidators.passwordMin6Chars],
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
  void onSubmitting() async{
    print(email.value);
    print(password.value);
    print(showSuccessResponse.value);

    await Future<void>.delayed(const Duration(seconds: 2));

    if(showSuccessResponse.value){
      emitSuccess();
    }else{
      emitFailure(failureResponse: 'This is an unknown  error!');
    }


  }

}
