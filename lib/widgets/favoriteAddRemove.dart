import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:name_address_translator/translateModel/favoriteModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteAddRemove {
  static const String _key = 'favoriteList';

  static Future<List<FavoriteData>> getFavoriteList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? favorites = prefs.getString(_key);

    if (favorites != null) {
      // 저장된 데이터가 있다면 JSON을 파싱하여 리스트로 변환

      final jsonList = jsonDecode(favorites) as List<dynamic>;
      return jsonList.map((e) => FavoriteData.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  static Future<void> addToFavoriteList(
      FavoriteData item, BuildContext context) async {
    List<FavoriteData> currentList = await getFavoriteList();

    // 중복 체크
    if (!currentList.contains(item)) {
      currentList.add(item);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String jsonString =
          jsonEncode(currentList.map((e) => e.toJson()).toList());
      prefs.setString(_key, jsonString);

      // 정상적으로 추가된 경우 스낵바로 알림
      AddedSnackbar(context);
    } else {
      // 이미 추가된 경우 스낵바로 알림
      DuplicateSnackbar(context);
    }
  }

  static void AddedSnackbar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('즐겨찾기에 추가되었습니다.', style: TextStyle(fontFamily: 'Dohyeon')),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void DuplicateSnackbar(BuildContext context) {
    const snackBar = SnackBar(
      content:
          Text('이미 즐겨찾기에 추가된 항목입니다.', style: TextStyle(fontFamily: 'Dohyeon')),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> removeFromFavoriteList(FavoriteData item) async {
    try {
      List<FavoriteData> currentList = await getFavoriteList();
      currentList.remove(item);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String jsonString =
          jsonEncode(currentList.map((e) => e.toJson()).toList());
      prefs.setString(_key, jsonString);
    } catch (e) {
      print('Error during removal: $e');
    }
  }
}
