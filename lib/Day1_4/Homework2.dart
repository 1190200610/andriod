import 'package:flutter/material.dart';
import 'package:startup_name/Day1_4/main.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

TextEditingController myCalController = TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This is a title',
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is app title'),
        ),
        body: Center(
            child: Column(
          children: [
            TextField(
              controller: myCalController,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: cal7,
                    style: ButtonStyle(),
                    child: Text('7')),
                ElevatedButton(
                    onPressed: cal8,
                    style: ButtonStyle(),
                    child: Text('8')),
                ElevatedButton(
                    onPressed: cal9,
                    style: ButtonStyle(),
                    child: Text('9')),
                ElevatedButton(
                    onPressed: calDiv,
                    style: ButtonStyle(),
                    child: Text('/')),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: cal4,
                    style: ButtonStyle(),
                    child: Text('4')),
                ElevatedButton(
                    onPressed: cal5,
                    style: ButtonStyle(),
                    child: Text('5')),
                ElevatedButton(
                    onPressed: cal6,
                    style: ButtonStyle(),
                    child: Text('6')),
                ElevatedButton(
                    onPressed: calMulti,
                    style: ButtonStyle(),
                    child: Text('*')),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: cal1,
                    style: ButtonStyle(),
                    child: Text('1')),
                ElevatedButton(
                    onPressed: cal2,
                    style: ButtonStyle(),
                    child: Text('2')),
                ElevatedButton(
                    onPressed: cal3,
                    style: ButtonStyle(),
                    child: Text('3')),
                ElevatedButton(
                    onPressed: calMinus,
                    style: ButtonStyle(),
                    child: Text('-')),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: cal0,
                    style: ButtonStyle(),
                    child: Text('0')),
                ElevatedButton(
                    onPressed: calPoint,
                    style: ButtonStyle(),
                    child: Text('.')),
                ElevatedButton(
                    onPressed: calEqual,
                    style: ButtonStyle(),
                    child: Text('=')),
                ElevatedButton(
                    onPressed: calAdd,
                    style: ButtonStyle(),
                    child: Text('+')),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

cal0 () {
  myCalController.text = myCalController.text + '0';
}

cal1 () {
  myCalController.text = myCalController.text + '1';
}

cal2 () {
  myCalController.text = myCalController.text + '2';
}

cal3 () {
  myCalController.text = myCalController.text + '3';
}

cal4 () {
  myCalController.text = myCalController.text + '4';
}

cal5 () {
  myCalController.text = myCalController.text + '5';
}

cal6 () {
  myCalController.text = myCalController.text + '6';
}

cal7 () {
  myCalController.text = myCalController.text + '7';
}

cal8 () {
  myCalController.text = myCalController.text + '8';
}

cal9 () {
  myCalController.text = myCalController.text + '9';
}

calAdd () {
  myCalController.text = myCalController.text + '+';
}

calMinus () {
  myCalController.text = myCalController.text + '-';
}

calMulti () {
  myCalController.text = myCalController.text + '*';
}

calDiv () {
  myCalController.text = myCalController.text + '/';
}

calEqual () {
  myCalController.text = myCalController.text + '=';
}

calPoint () {
  myCalController.text = myCalController.text + '.';
}


