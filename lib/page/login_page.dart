import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thai59/page/product_page.dart';
import 'package:thai59/utils/NColors.dart';

class NLoginPage extends StatefulWidget {

  static const String routeName = "/login";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/img_bg.png'),
          fit: BoxFit.cover, /* 完全填充*/
        )),
        child: Align(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
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
                    const  SimpleTextWidget("电话号码"),
                    const SimpleTextFieldWidget("请输入"),
                    SizedBox(
                      height: 20.r,
                    ),
                    const SimpleTextWidget("验证码"),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        const SimpleTextFieldWidget("请输入"),
                        // Row(children: [TextField()],),
                        TextButton(
                          child: const Text("获取验证码",
                              style: TextStyle(color: Color(0xFFFD696B))),
                          onPressed: () {
                            print("按钮点击事件");
                            Fluttertoast.showToast(msg: '验证码发送成功');
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
                        const Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "我已仔细阅读并同意遵守:",
                              style: TextStyle(
                                  fontSize: 12, color: NColors.black30)),
                          TextSpan(
                              text: "《隐私政策》",
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
  const buildButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: NColors.lg_bg,
          borderRadius: BorderRadius.circular(26)),
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
            backgroundColor:
            MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            Fluttertoast.showToast(msg: '登录');
            Navigator.pushNamed(context, NProductPage.routeName);
          },
          child: Text(
            "登录",
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
  final title;

  const SimpleTextWidget(this.title, {Key? key}) : super(key: key);

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

  const SimpleTextFieldWidget(this.hint, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: 1,
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
