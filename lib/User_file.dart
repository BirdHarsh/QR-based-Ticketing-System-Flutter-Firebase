import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String id;
  final DateTime OnDate;
  final String weekday;

  final String emailID;

  final String VisitAllow;
  Users(
      {this.id = '',
      required this.OnDate,
      required this.emailID,
      required this.VisitAllow,
      required this.weekday});

  Map<String, dynamic> toJson() => {
        'id': id,
        'OnDate': OnDate,
        'VisitAllow': VisitAllow,
        'emailID': emailID,
        'weekday': weekday
      };
  static Users fromJson(Map<String, dynamic> json) => Users(
      id: json['id'],
      OnDate: (json['OnDate'] as Timestamp).toDate(),
      emailID: json['emailID'],
      VisitAllow: json['VisitAllow'],
      weekday: json['weekday']
      /* birthday: (json['birthday'] as Timestamp).toDate(),*/
      );
}
