import 'dart:convert';

import 'package:name_address_translator/widgets/AddressResultCard.dart';
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

  static Future<void> addToFavoriteList(FavoriteData item) async {
    List<FavoriteData> currentList = await getFavoriteList();
    currentList.add(item);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(currentList.map((e) => e.toJson()).toList());
    prefs.setString(_key, jsonString);
  }

  static Future<void> removeFromFavoriteList(FavoriteData item) async {
    List<FavoriteData> currentList = await getFavoriteList();
    currentList.remove(item);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(currentList.map((e) => e.toJson()).toList());
    prefs.setString(_key, jsonString);
  }
}
