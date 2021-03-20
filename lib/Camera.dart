import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloudinary_client/cloudinary_client.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert';
class ImagePickerView extends StatefulWidget {
  @override
  State createState() {
    return Camera();
  }
}

//camera
class Camera extends State<ImagePickerView> {
  Future uploadImage(File image) async {
    CloudinaryClient client = new CloudinaryClient('875774284867727', 'ie6_7wmFuWElndBI5b355c8YcpY', 'dagcggcea');
    await client.uploadImage(image.path)
        .then((result){
          String tmp = result.url.toString();

          print("RESPOINDSNSDFI:: ${_postBackend(tmp)}==> result");
      print("CLOUDINARY:: ${result.secure_url}==> result");
    })
        .catchError((error) => print("ERROR_CLOUDINARY::  $error"));
  }
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


        /*decoration: BoxDecoration(
          // 枠線
          border: Border.all(color: Colors.blue, width: 2),
          // 角丸
          borderRadius: BorderRadius.circular(8),
        ),*/


        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(30),
              child: TextField(

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor:Colors.white,
                  hoverColor: Colors.white,

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

            (imageFile == null)
                ? Icon(Icons.no_sim)
                : Image.file(
              imageFile,
              height: 300.0,
              width: 300.0,

            ),



            /*TextButton(
              onPressed: () {
                _deleteImage();
              },
              child: Text('画像の消去'),
            ),*/




              // ignore: deprecated_member_use

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonTheme(
                  minWidth: deviceWidth * 0.4,
                  height: 45.0,
                  disabledColor: Colors.grey,
                  child: RaisedButton.icon(
                    icon: const Icon(
                      Icons.cloud_upload_outlined,
                      color: Colors.white,
                    ),
                    label: const Text('送信'),
                    onPressed:  !(imageFile != null) ? null : () {

                    },


                    color: Colors.greenAccent,
                    shape: const StadiumBorder(
                      side: BorderSide(color: Colors.green),
                    ),
                    textColor: Colors.white,
                  ),
                ) ,




                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[

                    ButtonTheme(
                      minWidth: deviceWidth * 0.4,
                      height: 45.0,
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
                      minWidth: deviceWidth * 0.4,
                      height: 45.0,
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
    uploadImage(imageFile);
    setState(() {
      this.imageFile = imageFile;
    });
  }
  Future<ApiResults> _postBackend(String requests) async {
    // 撮影/選択したFileが返ってくる
    String url = 'http://10.0.2.2/load:5000';
    var request = new SampleRequest(URL: requests);
    final response = await http.post(url,
        body: json.encode(request.toJson()),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      return ApiResults.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
  void _deleteImage()  {
    setState(() {
      this.imageFile = null ;
    });
  }
}
class SampleRequest {
  final String URL;
  SampleRequest({
    this.URL
  });
  Map<String, dynamic> toJson() => {
    'img_file':URL
  };
}
class ApiResults {
  final String message;
  ApiResults({
    this.message,
  });
  factory ApiResults.fromJson(Map<String, dynamic> json) {
    return ApiResults(
      message: json['message'],
    );
  }
}