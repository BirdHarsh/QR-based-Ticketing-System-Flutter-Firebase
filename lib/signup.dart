import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;
  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
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
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'NAMASTE!',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'bold',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 160, 160, 160),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0),
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
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(),
              child: Text(
                'SignUp',
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
              height: 20,
            ),
            TextField(
              controller: emailController,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Email ID'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(
                Icons.arrow_forward,
                size: 32,
              ),
              label: Text(
                'Sign Up',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: signUp,
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                  text: 'Already registered? ',
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignIn,
                        text: 'Log in',
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

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
