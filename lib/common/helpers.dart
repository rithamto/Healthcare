import 'dart:ui';

import 'package:testproject/common/global_constants.dart';
import 'package:testproject/common/storage/app_prefs.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:testproject/get_it.dart';

class Helpers {
  /// Handler Error App


  static Future<Locale> getCurentLocale() async {
    final language = await getIt<AppPref>().getLanguage();
    if (language == 'vi') {
      return const Locale('vi');
    }
    if (language == 'en') {
      return const Locale('en');
    }
    return Locale(Get.deviceLocale?.languageCode ?? 'en');
  }

  static Future<String> getFontFamily() async {
    final font = await getIt<AppPref>().getFont();
    return font ?? GlobalConstants.fonts.first;
  }

  static String formatCurrency({required String price}) {
    // return NumberFormat('#,###').format(price);
    return NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
        .format(double.parse(price));
  }
}
