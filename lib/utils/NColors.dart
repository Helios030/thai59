import 'package:flutter/material.dart';


 class NColors {
  static const Color black44 = Color(0xFF444444);
  static const Color black30 = Color(0xFF303030);
  static const Color meet57 = Color(0x57FD7D63);
  static const Color meetff = Color(0xFFFD7D63);
  static const Color pinkff = Color(0xFFFD696B);
  static const Color blue2a = Color(0xFF2A8DFF);
  static  LinearGradient lg_bg = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
   meetff,
  pinkff,
  ],
  );
}

 Color getPrimaryColor(BuildContext context) {
return Theme.of(context).primaryColor;
}