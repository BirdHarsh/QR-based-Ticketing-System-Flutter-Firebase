import 'package:flutter/material.dart';

import 'ticket.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:blurrycontainer/blurrycontainer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,

        image: AssetImage(
            'asset/images/back3c.jpg'), // a network image or a local image here,
      )),
      child: Scaffold(
        backgroundColor: Color.fromARGB(0, 3, 199, 49),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100, right: 230),
                child: Text(
                  ' Taj Mahal',
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
                padding: const EdgeInsets.only(top: 3.0, left: 9, right: 9),
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
                      child: CarouselSlider(
                        items: [
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: new AssetImage('asset/images/Taj1.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: new AssetImage('asset/images/taj2.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: new AssetImage('asset/images/taj3.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 1100),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ticket()),
                      );
                    },
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ticket()),
                    );
                  },
                  label: Text(
                    'Book Ticket',
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
