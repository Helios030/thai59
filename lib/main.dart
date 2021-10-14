import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thai59/page/routes_path.dart';
import 'package:thai59/page/page_util.dart';

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
          primaryColor: Colors.white,
          primaryColorLight: Colors.white,
          primaryColorDark: Colors.white,
        ),
        initialRoute: "/", // 默认加载的界面，这里为RootPage
        routes: { // 显式声明路由
          routes_path.def: (context) => NWelComePage(),
          routes_path.login: (context) => NLoginPage(),
          routes_path.product: (context) => NProductPage(),
        }
    );
  }
}


