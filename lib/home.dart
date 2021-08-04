import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_name/Day1_4/main.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:startup_name/detail.dart';

String URL = "http://521295f0.cpolar.io";
TextEditingController tec = TextEditingController();
var userName;



class HomeScreen extends StatefulWidget {
  HomeScreen(var pUserName) {
    pUserName = userName;
  }

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<dynamic> _data = List.filled(0, null);

  HomeScreenState();

  @override
  Widget build(BuildContext context) {
    _requestData(); //请求网络数据
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Another Page'),
          leading: IconButton(
              onPressed: () => {Navigator.pop(context, "Logout...")},
              icon: Icon(Icons.arrow_back)),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: _data.length,
                itemExtent: 70,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onDoubleTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detail()))
                          }, // 点击事件,跳转页面
                      child: Container(
                        margin: EdgeInsets.fromLTRB(40, 0, 20, 0),
                        child: Row(
                          children: <Widget>[
                            Image.network(
                              '${URL}/febs/images/avatar/${_data[index]['avatar']}',
                              width: 50,
                              height: 70,
                            ),
                            Text('  ${_data[index]['username']}'),
                            Spacer(),
                            Text('${_data[index]['roleName']}'),
                          ],
                        ),
                      ));
                })),
      ),
    );
  }

  _requestData() async {
    ///定义客户端，发送请求，接受请求，获取结果，关闭客户端
    String url = "$URL/user/list";
    HttpClient myHttpClient = HttpClient();
    HttpClientRequest myHttpClientRequest =
        await myHttpClient.getUrl(Uri.parse(url));
    HttpClientResponse myHttpClientResponse = await myHttpClientRequest.close();
    String ret = await myHttpClientResponse.transform(utf8.decoder).join();
    myHttpClient.close();
    tec.text = ret;

    setState(() {
      final jRet = json.decode(ret);
      _data = jRet['data']['rows'];
    });
  }
}
