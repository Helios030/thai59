import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thai59/pages/page_util.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:thai59/service/config.dart';
import 'package:thai59/utils/sp_data.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'generated/l10n.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  /**
   * packageName 有时获取不到
   * 缺少  sign
   *
   * */

  PackageInfo.fromPlatform().then((info) {
    PackConfig.appName = info.appName;
    PackConfig.packageName =
        info.packageName == "" ? "com.neutron.thaimoney" : info.packageName;
    PackConfig.version = info.version;
    PackConfig.buildNumber = info.buildNumber;

    print("fromPlatform  ${PackConfig().toString()}");
  });

  var uuid = const Uuid(options: {'grng': UuidUtil.cryptoRNG});
  sp_data.get("uuid", "").then((value) {
    if (value == null) {
      String uu = uuid.v1();
      PackConfig.uuid = uu;
      sp_data.put("uuid", uu);
    } else {
      PackConfig.uuid = value;
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
          GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
          GlobalWidgetsLocalizations.delegate, // 指定默认的文本排列方向, 由左到右或由右到左
          S.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          // 这里就是参数
          primaryColor: Colors.white,
          primaryColorLight: Colors.white,
          primaryColorDark: Colors.white,
        ),
        initialRoute: "/",
        // 默认加载的界面，这里为RootPage
        routes: {
          // 显式声明路由
          NWelComePage.routeName: (context) => NWelComePage(),
          NLoginPage.routeName: (context) => NLoginPage(),
          NProductPage.routeName: (context) => NProductPage(),
          NUserPage.routeName: (context) => NUserPage(),
        });
  }
}
