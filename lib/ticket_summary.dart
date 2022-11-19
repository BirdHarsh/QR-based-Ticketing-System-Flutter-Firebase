import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'User_file.dart';
import 'package:intl/intl.dart';

import 'package:firebase_auth/firebase_auth.dart';

class TicketSummary extends StatefulWidget {
  final String value;
  final DateTime ondate;
  final String copy;

  const TicketSummary(
      {Key? key, required this.value, required this.ondate, required this.copy})
      : super(key: key);

  @override
  State<TicketSummary> createState() => _TicketSummaryState();
}

class _TicketSummaryState extends State<TicketSummary> {
  /*final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }*/

  final controller = new TextEditingController();
  final control = new TextEditingController().value;
  String moved = 'no value';
  int sum = 0;
  DateTime OnDateM = DateTime.now();

  @override
  void initState() {
    super.initState();
    moved = widget.copy;
    OnDateM = widget.ondate;
    sum = 2 * int.parse(moved);
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).copyWith().size.height / 0,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,

          image: AssetImage(
              'asset/images/back1.jpg'), // a network image or a local image here,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 70, right: 125, bottom: 110),
                child: Text(
                  'Payment Summary',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'bold',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0, left: 9, right: 9),
                child: Center(
                  child: InkWell(
                    child: BlurryContainer(
                      elevation: 2,
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(8),
                      blur: 5,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      height: 500,
                      width: 500,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 19.0, left: 9, right: 9),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 56,
                              width: 400,
                              child: ListTile(
                                minVerticalPadding: 5,
                                leading: Text(
                                  'Date',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'bold',
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  textAlign: TextAlign.center,
                                ),
                                trailing: Text(
                                  '${OnDateM.day}/${OnDateM.month}/${OnDateM.year}',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'bold',
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 19.0, left: 9, right: 9),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 56,
                              width: 400,
                              child: ListTile(
                                minVerticalPadding: 5,
                                leading: Text(
                                  'Total Visitors',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'bold',
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  textAlign: TextAlign.center,
                                ),
                                trailing: Text(
                                  '${widget.value}',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'bold',
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 19.0, left: 9, right: 9),
                            child: Container(
                              height: 56,
                              width: 400,
                              child: ListTile(
                                minVerticalPadding: 5,
                                leading: Text(
                                  'Ticket Price',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'bold',
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  textAlign: TextAlign.center,
                                ),
                                trailing: Text(
                                  NumberFormat.simpleCurrency(
                                          locale: 'hi-IN', decimalDigits: 2)
                                      .format(2),
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'bold',
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 4.0, left: 9, right: 9),
                            child: Container(
                              height: 56,
                              width: 400,
                              child: ListTile(
                                minVerticalPadding: 5,
                                leading: Text(
                                  'Sub Total',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'bold',
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  textAlign: TextAlign.center,
                                ),
                                trailing: Text(
                                  NumberFormat.simpleCurrency(
                                          locale: 'hi-IN', decimalDigits: 2)
                                      .format(sum),
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'bold',
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),

                          Divider(
                            color: Colors.black,
                          ),
                          //last divider-------------------------------------------------------
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                width: 300.0,
                height: 50.0,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  ),
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 32,
                  ),
                  onPressed: () {
                    final VisitAllow = moved;
                    final OnDate = OnDateM;
                    final emailID = user.email!;
                    createUser(
                        VisitAllow: VisitAllow,
                        OnDate: OnDate,
                        weekday: OnDate.weekday.toString(),
                        emailID: emailID);
                  },
                  label: Text(
                    'Continue To Pay',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /*GooglePayButton(
                paymentConfigurationAsset: 'gpay.json',
                paymentItems: _paymentItems,
                type: GooglePayButtonType.order,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: onGooglePayResult,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Future createUser(
      {required String weekday,
      required String VisitAllow,
      required DateTime OnDate,
      required String emailID}) async {
    final docUser = FirebaseFirestore.instance.collection('tickets').doc();

    final user = Users(
      weekday: weekday,
      OnDate: OnDate,
      id: docUser.id,
      VisitAllow: VisitAllow,
      emailID: emailID,
    );
    final json = user.toJson();
    await docUser.set(json);
  }
}
