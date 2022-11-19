import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

import 'mybooking.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [Home(), mybooking(), profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.ticket,
                color: Color.fromARGB(255, 255, 255, 255)),
            label: 'My Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
