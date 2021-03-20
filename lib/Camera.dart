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
class Camera extends State {
  File imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        persistentFooterButtons: <Widget>[
          RaisedButton(
            child: Text(
              '送信',
            ),
            onPressed: () {

            },
          ),
          RaisedButton(
            child: Text(
              'キャンセル',
            ),
            onPressed: () {

            },
          ),

        ],

        body:  Container(
              decoration: BoxDecoration(
                // 枠線
                border: Border.all(color: Colors.blue, width: 2),
                // 角丸
                borderRadius: BorderRadius.circular(8),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextField(
                   style: new TextStyle(
                  fontSize: 40.0,
                  height: 2.0,
                  color: Colors.black
                  ),
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
                      contentPadding: EdgeInsets.all(10.0),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                  ButtonTheme(
                    minWidth: 200.0,
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
                    minWidth: 200.0,
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




                      /*RaisedButton(

                        child: const Text('Button'),
                        color: Colors.white,
                        shape: const StadiumBorder(
                          side: BorderSide(color: Colors.green),
                        ),
                        onPressed: () {},
                      ),*/

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
                  /*TextField(
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
                          width: 3.0,
                        ),
                      ),
                      hintText: 'タイトル入力',
                      contentPadding: EdgeInsets.all(16.0),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),*/

                ],
              ),
            )



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

