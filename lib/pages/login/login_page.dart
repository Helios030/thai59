import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thai59/generated/l10n.dart';
import 'package:thai59/pages/product_page.dart';
import 'package:thai59/service/login_request.dart';
import 'package:thai59/utils/NColors.dart';
import 'package:thai59/r.dart';
import 'package:thai59/utils/expand_util.dart';

class NLoginPage extends StatefulWidget {
  static String routeName = "/login";

  @override
  State<NLoginPage> createState() => _NLoginPageState();
}

class _NLoginPageState extends State<NLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeWidget());
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center, child: NContentBody());
  }
}

class NContentBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NCheckBoxState();
  }
}

class NCheckBoxState extends State<NContentBody> {
  var isCheck = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  var count = S.current.getVCode;
  late Timer timer;
  var currTime = 60;

  @override
  void initState() {


    dispose() {
      super.dispose();
      timer.cancel();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(R.assetsImagesImgBg),
          fit: BoxFit.cover, /* 完全填充*/
        )),
        child: Align(
          child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Container(
              decoration: BoxDecoration(
                  color: getPrimaryColor(context),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              width: 335.w,
              height: 362.h,
              child: Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SimpleTextWidget(S.current.phone_number),
                    SimpleTextFieldWidget(
                        S.of(context).plese_input, phoneController),
                    SizedBox(
                      height: 20.r,
                    ),
                    SimpleTextWidget(S.of(context).vCode),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        SimpleTextFieldWidget(
                            S.of(context).plese_input, codeController),
                        // Row(children: [TextField()],),
                        TextButton(
                          child: Text(count,
                              style: TextStyle(color: Color(0xFFFD696B))),
                          onPressed: () {
                         timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                              currTime--;
                              count="$currTime s";
                              if (currTime == 0) {
                                timer.cancel;
                                count=S.current.getVCode;
                              }
                              setState(() { });
                            });


                            String text = phoneController.text;
                            if (text == "") {
                              toast(S.of(context).plese_input);
                            } else {
                              Map<String, String> dataMap = {};
                              dataMap["phone"] = text;
                              dataMap["type"] = "2";
                              LoginRequest.sendCode(dataMap).then((value) {
                                if (value != null) {
                                  toast(S.of(context).send_success);
                                }
                              });
                            }
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isCheck,
                            onChanged: (value) {
                              setState(() {
                                isCheck = value!;
                              });
                            }),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: S.of(context).rade_success,
                              style: TextStyle(
                                  fontSize: 12, color: NColors.black30)),
                          TextSpan(
                              text: S.of(context).pp,
                              style: TextStyle(
                                  fontSize: 12, color: NColors.blue2a)),
                        ])),
                      ],
                    ),
                    buildButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class buildButton extends StatelessWidget {
  buildButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: NColors.lg_bg, borderRadius: BorderRadius.circular(26)),
      margin: EdgeInsets.only(
        right: 30.w,
        left: 30.w,
        top: 40.h,
      ),
      alignment: Alignment.center,
      child: SizedBox(
        width: double.infinity,
        height: 46.h,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            Fluttertoast.showToast(msg: S.of(context).login);
            Navigator.pushNamed(context, NProductPage.routeName);
          },
          child: Text(
            S.of(context).login,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.r),
          ),
        ),
      ),
    );
  }
}

class SimpleTextWidget extends StatelessWidget {
  final String title;

  SimpleTextWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: NColors.black44, fontSize: 14.sp, fontWeight: FontWeight.bold),
    );
  }
}

class SimpleTextFieldWidget extends StatelessWidget {
  final hint;
  final phoneController;

  SimpleTextFieldWidget(this.hint, this.phoneController);

  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: 1,
        controller: phoneController,
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.r)),
              borderSide: BorderSide(
                color: NColors.meet57,
                width: 5.r, //宽度为5
              )),
          focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.r)),
              borderSide: BorderSide(
                color: NColors.meetff,
                width: 5.r, //宽度为5
              )),
        ));
  }
}
