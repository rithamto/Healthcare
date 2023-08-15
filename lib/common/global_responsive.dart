import 'package:flutter/material.dart';

class Responsive {
  static width(double size, BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static height(double size, BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}