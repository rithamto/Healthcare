import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/common/global_images.dart';
import 'package:testproject/router_generator.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SplashScreen extends StatefulWidget {
  /// MARK: - Initials;
  static SplashScreen provider() {
    return SplashScreen();
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  /// MARK: - Initials;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    Future.delayed(const Duration(seconds: 2), () {
      navigator!.pushNamedAndRemoveUntil(
        RouteGenerator.mainScreen,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ScreenTypeLayout.builder(
      mobile: (BuildContext context) =>
          OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Image.asset(
            GlobalImages.splashPortraitScreen,
            width: ResponsiveAppUtil.width,
            fit: BoxFit.fill,
          );
        } else {
          return Image.asset(
            GlobalImages.splashLandscapeScreen,
            width: ResponsiveAppUtil.width,
            fit: BoxFit.fill,
          );
        }
      }),
      tablet: (BuildContext context) =>
          OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Image.asset(
            GlobalImages.splashPortraitScreen,
            width: ResponsiveAppUtil.width,
            fit: BoxFit.fill,
          );
        } else {
          return Image.asset(
            GlobalImages.splashLandscapeScreen,
            width: ResponsiveAppUtil.width,
            fit: BoxFit.fill,
          );
        }
      }),
      desktop: (BuildContext context) =>
          OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Image.asset(
            GlobalImages.splashPortraitScreen,
            width: ResponsiveAppUtil.width,
            fit: BoxFit.fill,
          );
        } else {
          return Image.asset(
            GlobalImages.splashLandscapeScreen,
            width: ResponsiveAppUtil.width,
            fit: BoxFit.fill,
          );
        }
      }),
    )));
  }
}
