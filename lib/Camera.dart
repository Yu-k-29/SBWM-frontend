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

        body: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              // 枠線
              border: Border.all(color: Colors.blue, width: 2),
              // 角丸
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              decoration: BoxDecoration(
                // 枠線
                border: Border.all(color: Colors.blue, width: 2),
                // 角丸
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      TextButton(
                        onPressed: () {
                          _getImageFromDevice(ImageSource.camera);
                        },
                        child: Text('カメラ起動'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () {
                          _getImageFromDevice(ImageSource.gallery);
                        },
                        child: Text('アルバムから取得'),
                      ),
                    ],
                  ),
                  TextField(
                      decoration: InputDecoration(
                          hintText: "入力してください"
                      )
                  ),
                  (imageFile == null)
                      ? Icon(Icons.no_sim)
                      : Image.file(
                    imageFile,
                    height: 100.0,
                    width: 100.0,
                  ),
                  TextButton(
                    onPressed: () {
                      _deleteImage();
                    },
                    child: Text('画像の消去'),
                  )
                ],
              ),
            )

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

