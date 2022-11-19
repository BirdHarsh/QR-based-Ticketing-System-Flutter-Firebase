import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Conform extends StatefulWidget {
  final String id;

  const Conform({Key? key, required this.id}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _ConformState createState() => _ConformState();
}

class _ConformState extends State<Conform> {
  final controller = TextEditingController();

  String movedid = 'no value';
  @override
  void initState() {
    super.initState();
    movedid = widget.id;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 139, 139, 139),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text("QR Code"),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: movedid,
                  size: 200,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    movedid,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
