import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginDemo extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginDemo({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'NAMASTE!',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'bold',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 160, 160, 160),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Container(
                    width: 330,
                    height: 180,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/logo.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                right: 264,
                bottom: 4,
              ),
              child: Text(
                'LogIn',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'bold',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 20, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3,
                          color: Color.fromARGB(255, 255, 0, 0)), //<-- SEE HERE
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Enter secure password'),
              ),
            ),
            TextButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(
                    color: Color.fromARGB(255, 160, 160, 160), fontSize: 15),
              ),
            ),
            SizedBox(
              height: 50,
              width: 332,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(
                  Icons.arrow_forward,
                  size: 32,
                ),
                label: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: signIn,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                  text: 'new user? ',
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,
                        text: 'SignUp',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.error))
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
