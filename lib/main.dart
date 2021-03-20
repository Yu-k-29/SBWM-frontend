import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}
const MaterialColor customSwatch = const MaterialColor(
  0xFF4FC3F7,//ここに欲しい色コードを挿入
  const <int, Color>{
    50: const Color(0xFFE1F5FE),
    100: const Color(0xFFE1F5FE),
    200: const Color(0xFFE1F5FE),
    300: const Color(0xFFE1F5FE),
    400: const Color(0xFFE1F5FE),
    500: const Color(0xFFE1F5FE),
    600: const Color(0xFFE1F5FE),
    700: const Color(0xFFE1F5FE),
    800: const Color(0xFFE1F5FE),
    900: const Color(0xFFE1F5FE),
  },
);
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: customSwatch,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(title: 'FlutterPractice'),
    );
  }
}