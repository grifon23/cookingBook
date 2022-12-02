// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'login_form.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [

                  SizedBox(
                    height: 25,
                  ),
                  //Hello again!
                  Text(
                    'Hello Again',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Wellcome back, you\'ve been missed!',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LoginForm(),

                  Text('Register now', style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w500),)
                ],
              ),
            )));
  }
}
