import 'package:flutter/material.dart';



class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm>{
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final controllerMail = TextEditingController();
  final controllerPassword = TextEditingController();

  void submit() {
    if(_globalKey.currentState!.validate()){
      print(_globalKey.currentState);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _globalKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(

            children: [
              TextFormField(
                controller: controllerMail,
                textInputAction: TextInputAction.next,
                focusNode: FocusNode(),
                validator: (val)  {
                  if(val == null || val.isEmpty){
                    return 'Field is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined, size: 20,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          style: BorderStyle.solid
                      )
                  ),

                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                          style: BorderStyle.solid
                      )
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.red,
                          width: 1.0,
                          style: BorderStyle.solid)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.red,
                          width: 1.0,
                          style: BorderStyle.solid
                      )
                  ),
                  border: OutlineInputBorder(),
                  label: Text('Email'),

                ),
              ),
              SizedBox(
                height: 15,
              ),

              //password
              TextFormField(
                controller: controllerPassword,
                validator: (val)  {
                  if(val == null || val.isEmpty){
                    return 'Field is required';
                  }
                  return null;
                },

                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline, size: 20,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          style: BorderStyle.solid
                      )
                  ),

                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                          style: BorderStyle.solid
                      )
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 1.0,
                          style: BorderStyle.solid)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.red,
                          width: 1.0,
                          style: BorderStyle.solid
                      )
                  ),
                  border: OutlineInputBorder(),
                  label: Text('Password'),
                ),

              ),
              SizedBox(
                height: 15,
              ),
              //sign in btn
              ElevatedButton(

                onPressed: ()=>submit(),
                child:Center(child: Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),)),),

              SizedBox(
                height: 5,
              ),],
          ),
        )
    );
  }

}