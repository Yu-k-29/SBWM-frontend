import 'package:flutter/material.dart';

class OcrList extends StatefulWidget {
  Map<String, dynamic> object;

  OcrList({Key key,this.object }) : super(key: key);
  @override
  _OcrListState createState() => _OcrListState();
}
Map<String, dynamic> DefaultData() {
  return   {
    'red': {
      'text':['jdds','jidwji'],
      'square':['mfesp','jfeio']
    },
    'green': {
      'text':['jdds','jidwji','fuejuif','hduwih','hduwh'],
      'square':['mfesp','jfeio']
    },
    'blue': {
      'text':['jdds','jidwji'],
      'square':['mfesp','jfeio']
    },
    'Black': {
      'text':['jdds','jidwji'],
      'square':['mfesp','jfeio']
    },
  };
}
// リスト一覧画面用Widget
class _OcrListState extends State<OcrList> {


  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = widget.object['data'];
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    Map<String, dynamic> redMap1 = data['red'];
    Map<String, dynamic> greenMap1 = data['green'];
    Map<String, dynamic> blueMap1 = data['blue'];
    Map<String, dynamic> blackMap1 = data['Black'];
    List<dynamic> redMap = redMap1['text'];
    List<dynamic> greenMap = greenMap1['text'];
    List<dynamic> blueMap = blueMap1['text'];
    List<dynamic> blackMap = blackMap1['text'];
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(8, 24, 8, 8),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Center(
                    child: Text('タイトル(赤い枠の中の文字)'),
                  ),
                )
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: deviceWidth * 0.5,
                      height: deviceHeight,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text('黒い文字'),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: blackMap.length,
                              padding: EdgeInsets.only(top: 100),
                              itemBuilder: (BuildContext, int index) {
                                return ListTile(
                                  title: Text(blackMap[index].toString()),
                                );
                              }
                          ),
                        ],
                      )
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              width: deviceWidth * 0.5,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(10),
                              ),
                                child: Column(
                                  children: [
                                    Text('赤色の文字'),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: redMap.length,
                                        padding: EdgeInsets.only(top: 100),
                                        itemBuilder: (BuildContext, int index) {
                                          return ListTile(
                                            title: Text(redMap[index].toString()),
                                          );
                                        }
                                    ),
                                  ],
                                )
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Container(
                                width: deviceWidth * 0.5,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Text('緑色の文字'),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: greenMap.length,
                                        itemBuilder: (BuildContext, int index) {
                                          return ListTile(
                                            title: Text(greenMap[index].toString()),
                                          );
                                        }
                                    ),
                                  ],
                                )
                              )
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text('青色の文字'),
                    ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.fromLTRB(70, 30, 0, 70),
                        itemCount: blueMap.length,
                        itemBuilder: (BuildContext, int index) {
                          return ListTile(
                            title: Text(blueMap[index].toString()),
                          );
                        }
                    ),
                  ],
                )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('h'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class SubListItem extends StatelessWidget {
  final String containt;

  SubListItem({Key key,this.containt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(containt),
    );
  }
}