import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerView extends StatefulWidget {
  @override
  State createState() {
    return Camera();
  }
}

//camera
class Camera extends State<ImagePickerView> {
  File imageFile;
  //タイトル
  String ImageTitle = "タイトル名:";
  // 入力された内容を保持するコントローラ
  final inputController = TextEditingController();
  //入力された時の処理
  void setText (String s){
    setState(() {
      ImageTitle = s;
    });
  }
  // 表示用の変数

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(

        decoration: BoxDecoration(
          // 枠線
          border: Border.all(color: Colors.blue, width: 2),
          // 角丸
          borderRadius: BorderRadius.circular(8),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(30),
              child: TextField(
                decoration: InputDecoration(
                  //Focusしていないとき
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),

                  ),
                  //Focusしているとき
                  focusedBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 0.5,
                    ),
                  ),
                  hintText: 'タイトル入力',
                  contentPadding: EdgeInsets.fromLTRB(12,12,12,12),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.black,
                    ),

                    onPressed: () {
                      setText(inputController.text);

                    },
                  ),
                ),
              ),
            ),


            Text(ImageTitle),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                ButtonTheme(
                  minWidth: deviceWidth * 0.45,
                  height: 60.0,
                  child: RaisedButton.icon(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    label: const Text('カメラ起動'),
                    onPressed: () {
                      _getImageFromDevice(ImageSource.camera);
                    },
                    color: Colors.lightBlue,
                    shape: const StadiumBorder(
                      side: BorderSide(color: Colors.green),
                    ),
                    textColor: Colors.white,
                  ),
                ) ,
                ButtonTheme(
                  minWidth: deviceWidth * 0.3,
                  height: 60.0,
                  child: RaisedButton.icon(
                    icon: const Icon(
                      Icons.folder_open,
                      color: Colors.white,
                    ),
                    label: const Text('アルバムから取得'),
                    onPressed: () {
                      _getImageFromDevice(ImageSource.gallery);
                    },
                    color: Colors.lightBlue,
                    shape: const StadiumBorder(
                      side: BorderSide(color: Colors.green),
                    ),
                    textColor: Colors.white,
                  ),
                ),


              ],
            ),
            (imageFile == null)
                ? Icon(Icons.no_sim)
                : Image.file(
              imageFile,
              height: 300.0,
              width: 300.0,
            ),
            TextButton(
              onPressed: () {
                _deleteImage();
              },
              child: Text('画像の消去'),
            ),

              // ignore: deprecated_member_use

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: Text(
                    'キャンセル',
                  ),
                  onPressed: () {

                  },
                ),
                RaisedButton(
                  child: Text(
                    '送信',
                  ),
                  onPressed: () {

                  },
                ),
              ],

            )




          ],
        ),



        );



  }
  // カメラまたはライブラリから画像を取得
  void _getImageFromDevice(ImageSource source) async {
    // 撮影/選択したFileが返ってくる
    var imageFile = await ImagePicker.pickImage(source: source);
    // Androidで撮影せずに閉じた場合はnullになる
    if (imageFile == null) {
      return;
    }
    setState(() {
      this.imageFile = imageFile;
    });
  }
  void _deleteImage()  {
    setState(() {
      this.imageFile = null ;
    });
  }
}

