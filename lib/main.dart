import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData( // 这里就是参数
          primaryColor: Colors.white,
        ),
        home: WelCome());
  }


}

class WelCome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 280,
        child: Image.asset("images/img_welcome.png"),
      ),
    );
  }
}
