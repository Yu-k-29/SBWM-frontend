import 'package:flutter/material.dart';

class OcrList extends StatefulWidget {
  String title;

  OcrList({Key key,this.title}) : super(key: key);
  @override
  _OcrListState createState() => _OcrListState();
}

// リスト一覧画面用Widget
class _OcrListState extends State<OcrList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('h'),
    );
  }
}