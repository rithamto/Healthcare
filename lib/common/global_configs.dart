import 'package:flutter/material.dart';

class GlobalConfigs {
  static const String kAppName = 'Di4l Sell';
  static const supportedLocales = [
    Locale('en'),
    Locale('vi'),
  ];
}

class Responsive {
  static width(double size, BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static height(double size, BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
