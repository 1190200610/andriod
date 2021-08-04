import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_name/Day1_4/main.dart';
import 'dart:io';

class Detail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailState();
  }
}

class DetailState extends State<Detail> {
  var _currentIndex = 0;
  List<Widget> _childrenWidget = [
    Home(),
    Alarms(),
    Person(),
    Accessibility(),
    Chart(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is detail page'),
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(Icons.arrow_back_ios_new_sharp),
          ),
        ),
        body: _childrenWidget[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (int index) => {
            setState(() {
              _currentIndex = index;
            })
          },
          items: [
            BottomNavigationBarItem(backgroundColor: Colors.pink, label: 'home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'alarms', icon: Icon(Icons.access_alarms)),
            BottomNavigationBarItem(label: 'person', icon: Icon(Icons.person_pin)),
            BottomNavigationBarItem(label: 'accessibility', icon: Icon(Icons.accessibility_new_rounded)),
            BottomNavigationBarItem(label: 'chart', icon: Icon(Icons.addchart_rounded)),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Home Page');
  }
}

class Alarms extends StatelessWidget {
  const Alarms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Alarms Page');
  }
}
class Person extends StatelessWidget {
  const Person({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Person Page');
  }
}
class Accessibility extends StatelessWidget {
  const Accessibility({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Accessibility Page');
  }
}
class Chart extends StatelessWidget {
  const Chart ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Chart  Page');
  }
}
