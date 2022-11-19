import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'qrcode.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'User_file.dart';

class mybooking extends StatefulWidget {
  const mybooking({Key? key}) : super(key: key);
  @override
  _mybookingState createState() => _mybookingState();
}

class _mybookingState extends State<mybooking> {
  final user = FirebaseAuth.instance.currentUser!;
  get emailid => user.email!;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/images/back4.jpg"), fit: BoxFit.cover),
        ),
        padding:
            const EdgeInsets.only(top: 50.0, right: 10, left: 10, bottom: 20),
        child: BlurryContainer(
          padding:
              const EdgeInsets.only(top: 19.0, right: 5, left: 5, bottom: 5),
          elevation: 2,
          color: Colors.transparent,
          blur: 5,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: StreamBuilder<List<Users>>(
              stream: readUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong! ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final users = snapshot.data!;

                  return ListView(
                    children: users.map(buildUser).toList(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }

  Widget buildUser(Users user) => ListTile(
        leading: CircleAvatar(
          child: Text('${user.VisitAllow}'),
          backgroundColor: Colors.black,
        ),
        title: Text(user.emailID),
        subtitle: Text(user.OnDate.toIso8601String()),
        trailing: Text(user.id),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Conform(
                    id: user.id,
                  )));
        },
      );

  Stream<List<Users>> readUsers() => FirebaseFirestore.instance
      .collection('tickets')
      .where('emailID', isEqualTo: emailid)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Users.fromJson(doc.data())).toList());
}
