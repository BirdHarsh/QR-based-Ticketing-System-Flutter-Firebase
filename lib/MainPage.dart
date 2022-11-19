import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'HomePage.dart';
import 'authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('somrthingwent wrong!'),
            );
          } else if (snapshot.hasData) {
            return HomePage();
          } else {
            return AuthPage();
          }
        },
      ));
}
