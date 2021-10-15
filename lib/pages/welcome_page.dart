import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thai59/pages/login/login_page.dart';
import 'package:thai59/r.dart';



var isFirst = true;

class NWelComePage extends StatefulWidget {

  static const String routeName = "/";

  @override
  State<NWelComePage> createState() => _NWelComePageState();
}

class _NWelComePageState extends State<NWelComePage> {

  @override
  void initState() {
    super.initState();
    if (isFirst) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        //判断是否需要登录
        Navigator.pushNamed(context, NLoginPage.routeName);
        isFirst = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    //屏幕适配
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(375, 760),
        orientation: Orientation.portrait);


    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Align(
        child: Container(
          height: 300.w,
          width: 280.h,
          child: Image.asset(R.assetsImagesImgWelcome),
        ),
      ),
    );
  }
}
