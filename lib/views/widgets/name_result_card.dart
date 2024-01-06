import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:name_address_translator/models/model/favorite_model.dart';
import 'package:name_address_translator/models/model/name_translate_model.dart';
import 'package:name_address_translator/models/repository/favorite_add_remove.dart';


class NameResultCard extends StatelessWidget {
  const NameResultCard({super.key, required this.result});

  final NameItemModel result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.engName,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                Text(
                  '정확도: ${result.accuracy} %',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                copyToClipboard(result.engName);
                const snackBar = SnackBar(
                  content: Text(
                    '클립보드에 복사되었습니다.',
                    style: TextStyle(fontFamily: 'Dohyeon'),
                  ),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(
                Icons.content_copy,
                size: 25,
              )),
          IconButton(
              onPressed: () {
                FavoriteData favoriteData = FavoriteData(
                    firstString: result.engName,
                    secondString: '정확도: ${result.accuracy} %');
                FavoriteAddRemove.addToFavoriteList(favoriteData, context);
              },
              icon: const Icon(
                Icons.favorite_border,
                size: 25,
              ))
        ],
      ),
    );
  }
}

void copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}
