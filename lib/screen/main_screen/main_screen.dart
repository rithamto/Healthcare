// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:testproject/screen/main_screen/mobile/main_screen_mobile.dart';
class MainScreen extends StatelessWidget {
  /// MARK: - Initials;
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => MainMobileScreen.provider(),
    );
  }
}