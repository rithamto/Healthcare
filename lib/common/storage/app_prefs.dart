import 'dart:convert';

import 'package:testproject/common/global_constants.dart';
import 'package:testproject/common/storage/base_prefs.dart';

class AppPref extends BasePrefs {
  /// MARK: - Initials;
  static Future<AppPref> instance() async {
    final appPref = AppPref();
    await appPref.init();
    return appPref;
  }

  /// Save Token
  Future<void> saveToken({required String tokenJson}) async {
    await setValueForKey(GlobalConstants.kToken, tokenJson);
  }

  /// Get Token
  
  /// Language
  Future<String?> getLanguage() async {
    final language = getValueForKey<String?>(GlobalConstants.kLanguage);
    return language;
  }

  /// Language
  Future<void> savelanguage({required String languageCode}) async {
    await setValueForKey(GlobalConstants.kLanguage, languageCode);
  }

  /// Font family
  Future<String?> getFont() async {
    final font = getValueForKey<String?>(GlobalConstants.FONTFAMILY);
    return font;
  }

  /// Font family
  Future<void> setFont({required String font}) async {
    await setValueForKey(GlobalConstants.FONTFAMILY, font);
  }

  /// Font family
  Future<void> setMenuData({required String menu}) async {
    await setValueForKey(GlobalConstants.MENUDATA, menu);
  }

  /// Font family
  Future<String?> getMenuData() async {
    final data = getValueForKey<String?>(GlobalConstants.MENUDATA);
    return data ?? '';
  }

  Future<void> saveTable({required String table}) async {
    await setValueForKey(GlobalConstants.kTable, table);
  }

  Future<String?> getTable() async {
    final table = getValueForKey<String?>(GlobalConstants.kTable);
    return table;
  }

  Future<void> removeTable() async {
    await remove(key: GlobalConstants.kTable);
  }

  Future<void> saveNote({required String note}) async {
    await setValueForKey(GlobalConstants.kNote, note);
  }

  Future<String?> getNote() async {
    final note = getValueForKey<String?>(GlobalConstants.kNote);
    return note;
  }

  Future<void> removeNote() async {
    await remove(key: GlobalConstants.kNote);
  }

  Future<void> saveCart({required String cartLines}) async {
    await setValueForKey(GlobalConstants.kCart, cartLines);
  }

  Future<String?> getCart() async {
    final cart = getValueForKey<String?>(GlobalConstants.kCart);
    return cart;
  }

  Future<void> removeCart() async {
    await remove(key: GlobalConstants.kCart);
  }

  Future<void> saveLoginInput(
      {required String username, required String password}) async {
    await setValueForKey(GlobalConstants.USERNAME, username);
    await setValueForKey(GlobalConstants.PASSWORD, password);
  }

  Future<String> getUsernameInput() async {
    return await getValueForKey(GlobalConstants.USERNAME) ?? '';
  }

  Future<String> getPasswordInput() async {
    return await getValueForKey(GlobalConstants.PASSWORD) ?? '';
  }

  Future<void> saveStaffList({required Map<String, dynamic> staffList}) async {
    await setValueForKey(GlobalConstants.STAFFLIST, jsonEncode(staffList));
  }

  Future<Map<String, dynamic>> getStaffList() async {
    return await jsonDecode(getValueForKey(GlobalConstants.STAFFLIST)) ?? {};
  }
}
