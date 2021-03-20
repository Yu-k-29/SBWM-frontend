import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async'; //非同期処理用
import 'dart:convert'; //httpレスポンスをJSON形式に変換用

//camera
class test extends StatefulWidget {
  @override
  State createState() {
    return testState();
  }
}
class testState extends State<test> {
  String url = 'http://10.0.2.2:5000';
  String data = 'jjjj';
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Center(
      child: Text('jfeijefio')
=======
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  getData();
                },
                child: Text('押そう')
            ),
            Text(data),
          ],
        ),
      )
>>>>>>> fdcc309... API接続の確立
    );
  }
  Future getData() async{ //Future xxx async{} という記法
    final response = await http.get(url);
    if(response.statusCode == 200) {
      setState(() {
        data = response.body.toString();
      });
    }
  }


}