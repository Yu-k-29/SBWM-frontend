import 'package:flutter/material.dart';
import 'package:sbwm/profile.dart';
import 'test.dart';
import 'Camera.dart';
class Home extends StatefulWidget {
  // This widget is the root of your application.
  String title;

  Home({Key key,this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var _titles = ['Button1','Button2'];
  Map <String, String> title1 = {
    'button1name':'PROFILE',
    'button2name':'Camera',
    'button3name':'HOME',
  };
  List <String> title2 = [
    'Camera','Profile','Home'
  ];
  //ページ切替用
  PageController _pageController;
  //ページインデックス保存用
  int _screen = 1;

  @override
  void initState() {
    super.initState();
    // コントローラ作成
    _pageController = PageController(
      initialPage: _screen, // 初期ページの指定。
    );
  }

  @override
  void dispose() {
    // コントローラ破棄
    _pageController.dispose();
    super.dispose();
  }
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.cake),
        title: Text('${title1['button1name']}'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.camera),
        title: Text('${title1['button2name']}'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('${title1['button3name']}'),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/theme_4.webp'),
            fit: BoxFit.cover
          )
        ),
        child: PageView(
            controller: _pageController,
            // ページ切り替え時に実行する処理
            // PageViewのonPageChangedはページインデックスを受け取る
            // 以下ではページインデックスをindexとする
            onPageChanged: (index) {
              setState(() {
                // ページインデックスを更新
                _screen = index;
              });
            },
            // ページ下部のナビゲーションメニューに相当する各ページビュー
            children: [
              OcrList(),
              ImagePickerView(),
              test(),


            ]),
      ),



      bottomNavigationBar: BottomNavigationBar(
        // 現在のページインデックス
        currentIndex: _screen,
        // onTapでナビゲーションメニューがタップされた時の処理を定義
        onTap: (index) {
          setState(() {
            // ページインデックスを更新
            _screen = index;

            // ページ遷移を定義。
            // curveで指定できるのは以下
            // https://api.flutter.dev/flutter/animation/Curves-class.html
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        },
        // 定義済のナビゲーションメニューのアイテムリスト
        items: myBottomNavBarItems(),
      ),
    );
  }
}