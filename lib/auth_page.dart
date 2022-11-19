import 'signup.dart';
import 'package:flutter/material.dart';
import 'authenticate.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginDemo(onClickedSignUp: toggle)
      : SignUpWidget(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
