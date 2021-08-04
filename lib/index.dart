import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:startup_name/Day1_4/main.dart';
import 'dart:io';

import 'package:startup_name/home.dart';
import 'package:startup_name/search.dart';

TextEditingController myUsernameController = TextEditingController();
TextEditingController myPassWordController = TextEditingController();
String URL = "http://521295f0.cpolar.io";

class IndexScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexScreenState();
  }
}

class IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to my app'),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),    //内边界距离
          margin: EdgeInsets.all(20.0),     //外边界距离
          child: Column(
            children: <Widget>[
              Image.network(
                  "https://i0.hdslb.com/bfs/archive/04663f46513bcef96d8835a897a96c8237fd9860.png"),
              UserName(),
              PassWord(),
              Row(
                children: <Widget>[
                  LoginButton(),
                  CancelButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myUsernameController,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_pin),
          labelText: '用户名称',
          hintText: '用户名不能为空'),
    );
  }
}

class PassWord extends StatelessWidget {
  const PassWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myPassWordController,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline_rounded),
          labelText: '密码',
          hintText: '密码不能为空'),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ()=>{_processLogin(context)}, child: Text('登录'));
  }

  _processLogin(BuildContext context) async {
    ///定义客户端，发送请求，接受请求，获取结果，关闭客户端
    String url = "$URL/app_login?username=${myUsernameController.text}&password=${myPassWordController.text}";
    HttpClient myHttpClient = HttpClient();
    HttpClientRequest myHttpClientRequest = await myHttpClient.postUrl(Uri.parse(url));
    HttpClientResponse myHttpClientResponse = await myHttpClientRequest.close();
    String ret = await myHttpClientResponse.transform(utf8.decoder).join();
    myHttpClient.close();
    print(ret);

    ///用json判断获取到的状态
    var myJSON = json.decode(ret);
    if(myJSON['code'] == 200) {
      final ret = await Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
      print('登陆成功 $ret');
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text( '登陆失败，请重新输入')));
    }
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ()=>{}, child: Text( '取消'));
  }
}


