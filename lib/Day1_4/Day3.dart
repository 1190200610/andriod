import 'package:flutter/material.dart';
import 'package:startup_name/Day1_4/main.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

TextEditingController myUsernameController = TextEditingController();
TextEditingController myPassWordController = TextEditingController();
String URL = "http://5d77a2ba.cpolar.io";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This is a title',
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is app title'),
          actions: <Widget>[
            IconButton(
                onPressed: buttonPress, icon: Icon(Icons.access_alarms_sharp))
          ],
          leading: IconButton(
              onPressed: buttonPress, icon: Icon(Icons.account_balance_wallet)),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            TextField(
              controller: myUsernameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_pin),
                  labelText: '用户名称',
                  hintText: '用户名不能为空'),
            ),
            TextField(
              controller: myPassWordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  labelText: '密码',
                  hintText: '密码不能为空'),
            ),
            ElevatedButton(
              onPressed: buttonPress,
              child: Text('This is a button'),
            ),
            Image.network("http://5d77a2ba.cpolar.io/images/captcha/"),
          ],
        )),
        // child: Image.asset("images/bg.jpg"),
        // child: Image.network("https://img04.sogoucdn.com/v2/thumb/retype/ext/auto/q/75/?appid=201085&url=//123p3.sogoucdn.com/imgu/2018/04/20180404144123_595.png"),
        // child: Text(
        //   'This is a text',
        //   style: TextStyle(
        //     color: Colors.blue,
        //     backgroundColor: Colors.blueGrey,
        //   ),
        // ),
        // child: ElevatedButton(
        //   child: Text('This is a button'),
        //   onPressed: ()=>(print('button pressed')),
      ),
    );
  }
}

void buttonPress() {
  print(
      "Username: ${myUsernameController.text}  KeyWords: ${myPassWordController.text}");
}
