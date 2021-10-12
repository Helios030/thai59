import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData( // 这里就是参数
          brightness: Brightness.light,
          cupertinoOverrideTheme: const CupertinoThemeData(
              brightness: Brightness.light
          ),
          primaryColor: Colors.white,
        ),
        initialRoute: "/", // 默认加载的界面，这里为RootPage
        routes: { // 显式声明路由
          "/": (context) => WelComePage(),
          "/Login": (context) => LoginPage(),

        }

    );
  }


}


class WelComePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushNamed(context, '/Login');
    });
    return Center(
      child: Container(
        height: 300,
        width: 280,
        child: Image.asset("images/img_welcome.png"),
      ),
    );
  }
}


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
    height: double.infinity,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
        image:  DecorationImage(
          image: AssetImage("images/img_bg.png",),
          fit: BoxFit.cover,
        ),
      ),
      child: Card(

      ) ,




    );
  }

}

