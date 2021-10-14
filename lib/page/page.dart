import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thai59/page/routes_path.dart';

var isFirst = true;

class NWelComePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(375, 760),
        orientation: Orientation.portrait);

    if (isFirst) {
      Future.delayed(const Duration(milliseconds: 3000), () {

        //判断是否需要登录
        Navigator.pushNamed(context, routes_path.login);


        isFirst = false;
      });
    }
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Align(
        child: Container(
          height: 300.w,
          width: 280.h,
          child: Image.asset("images/img_welcome.png"),
        ),
      ),
    );
  }
}
