
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thai59/utils/NColors.dart';



class NUserPage extends StatelessWidget {
  const NUserPage({Key? key}) : super(key: key);
  static const String routeName = "/user";


  @override
  Widget  build(BuildContext context) {

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(375, 760),
        orientation: Orientation.portrait);

    return Scaffold(body: UserWidget());
  }
}

class UserWidget extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
   return Container(
       decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('images/img_bg.png'), fit: BoxFit.cover, /* 完全填充*/)),
       child: Align(
         child: Padding(
           padding: const EdgeInsets.only(top: 100),
           child: Container(
             decoration: BoxDecoration(color: getPrimaryColor(context), borderRadius: BorderRadius.all(Radius.circular(12.r))),
             width: 335.w,
             height: 403.h,
             child: Padding(padding: EdgeInsets.all(20.r),
             child: Column(
               children: [
                 _buildItem((){Fluttertoast.showToast(msg: '1');}),
                 _buildItem((){Fluttertoast.showToast(msg: '2');}),
                 _buildItem((){Fluttertoast.showToast(msg: '3');}),
                 _buildItem((){Fluttertoast.showToast(msg: '4');})
               ],
             )
 ,
             ),
           ),
         ),
       ),

   );
  }
}

class _buildItem extends StatelessWidget {
  final Function onTapFun;
  _buildItem(this.onTapFun);
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: onTapFun(),
         child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.house),
                  Container(
                      width: 250.w,
                      child: Text("我的贷款")),
                  Icon(Icons.arrow_forward_ios_sharp),
                ],
              ),
              Container(height: 0.5.r,width: 280.w,color: NColors.blue33,margin: EdgeInsets.only(top: 12.w),)
            ],
          )

      );




  }
}
