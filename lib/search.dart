import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_name/Day1_4/main.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:startup_name/detail.dart';

String URL = "http://521295f0.cpolar.io";
TextEditingController myTextEditingController = TextEditingController();
List<dynamic> _data = List.filled(0, null);

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    _requestData();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Search Page"),
          leading: IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon: Icon(Icons.arrow_back)),
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                SearchTextField(),
                SearchButton(),
                Row(
                  children: <Widget>[
                    Image.network(
                      '${URL}/febs/images/avatar/${_data[3]['avatar']}',
                      width: 50,
                      height: 70,
                    ),
                    Text('  ${_data[3]['username']}'),
                    Spacer(),
                    Text('${_data[3]['roleName']}'),
                  ],
                ),
              ],
            ),
        ),
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

    setState(() {
      final jRet = json.decode(ret);
      _data = jRet['data']['rows'];
    });
  }

}

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myTextEditingController,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.saved_search),
          labelText: '搜索内容',
          hintText: '搜索内容不能为空'),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ()=>{}, child: Text('搜索'));
  }
}


