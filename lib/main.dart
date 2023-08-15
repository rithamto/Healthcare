import 'dart:async';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:testproject/common/global_configs.dart';
import 'package:testproject/common/helpers.dart';
import 'package:testproject/generated/locales.g.dart';

import 'router_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AfterLayoutMixin {
  /// MARK: - Initials;
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    final locale = await Helpers.getCurentLocale();
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHud(
      isGlobalHud: true,
      child: GetMaterialApp(
        locale: Get.locale,
        title: GlobalConfigs.kAppName,
        translationsKeys: AppTranslation.translations,
        supportedLocales: GlobalConfigs.supportedLocales,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!,
          );
        },
        fallbackLocale: const Locale('en'),
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: Get.key,
        initialRoute: '/',
      ),
    );
  }
}
