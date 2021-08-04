import 'package:flutter/material.dart';
import 'package:startup_name/Day1_4/main.dart';
import 'dart:io';

void main() {
  runApp(MyNewApp());
}

TextEditingController myUsernameController = TextEditingController();
TextEditingController myPassWordController = TextEditingController();

/// 组件
class MyNewApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //返回组件的状态，用来交互
    return MyNewAppState();
  }
}

/// 状态
class MyNewAppState extends State<MyNewApp> {
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
              /// Column的默认布局为start, 改变Column放置状态
              mainAxisAlignment:MainAxisAlignment.start,
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

  @override
  void initState() {
    debugPrint(">>>> initState");
    super.initState();
  }

  /// 重构组件
  @override
  void didUpdateWidget(MyNewApp mna) {
    debugPrint(">>>> didUpdateWidget");
    super.didUpdateWidget(mna);
  }

  /// 组件变为非活动状态
  @override
  void deactivate() {
    debugPrint(">>>> deactivate");
    super.deactivate();
  }

  /// 组件被销毁
  @override
  void dispose() {
    debugPrint(">>>> dispose");
    super.dispose();
  }
}

void buttonPress() {
  print(
      "Username: ${myUsernameController.text}  KeyWords: ${myPassWordController
          .text}");
}
