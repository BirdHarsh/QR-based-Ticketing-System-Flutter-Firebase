import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Signed in as',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            user.email!,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
              backgroundColor: Colors.black,
            ),
            icon: Icon(
              Icons.arrow_back,
              size: 32,
            ),
            onPressed: () => FirebaseAuth.instance.signOut(),
            label: Text(
              'Sign Out',
              style: TextStyle(fontSize: 24),
            ),
          )
        ],
      ),
    ));
  }
}
