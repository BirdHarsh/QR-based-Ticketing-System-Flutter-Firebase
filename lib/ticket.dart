import 'package:flutter/material.dart';

import 'ticket_summary.dart';

import 'package:blurrycontainer/blurrycontainer.dart';

class ticket extends StatefulWidget {
  const ticket({Key? key}) : super(key: key);
  @override
  _ticketState createState() => _ticketState();
}

class _ticketState extends State<ticket> {
  final _textController = new TextEditingController();
  DateTime date = DateTime.now();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,

        image: AssetImage(
            'asset/images/back2.jpg'), // a network image or a local image here,
      )),
      child: Scaffold(
        backgroundColor: Color.fromARGB(0, 3, 199, 49),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100, right: 230),
                child: Text(
                  'Taj Mahal',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'bold',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 251, bottom: 40),
                child: Text(
                  'Agra City',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'bold',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 160, 160, 160)),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3, left: 9, right: 9),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Center(
                        child: InkWell(
                          child: BlurryContainer(
                            elevation: 1,
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(8),
                            blur: 5,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            height: 300,
                            width: 500,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  child: Text(
                                    'Visitors Details',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'bold',
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 1, left: 170),
                                  child: Text(
                                    'Number of Visitors',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'bold',
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0, left: 9, right: 9),
                                  child: TextField(
                                    controller: _textController,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 3,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                        border: OutlineInputBorder(),
                                        labelText: 'Enter Here',
                                        labelStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 100, 100, 100)),
                                        hintText: 'Maximum: 10'),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 1, left: 270),
                                  child: Text(
                                    'Date',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'bold',
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 1.0, left: 9, right: 9),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    height: 56,
                                    width: 400,
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 1.0, left: 8, right: 33),
                                          child: Text(
                                            '${date.day}/${date.month}/${date.year}',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                        ),

                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                          ),
                                          onPressed: () async {
                                            DateTime? newDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: date,
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2028),
                                            );

                                            if (newDate == null) return;

                                            setState(() => date = newDate);
                                          },
                                          child: Text('Select Date'),
                                        ),
                                        // insert row1 here
                                      ],
                                    ),
                                  ),
                                ),
                                //insert column wise here

                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                    // navigation herererrerererere
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TicketSummary(
                              value: _textController.text,
                              ondate: date,
                              copy: _textController.text,
                            )));
                  },
                  label: Text(
                    'Conform And Next',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
