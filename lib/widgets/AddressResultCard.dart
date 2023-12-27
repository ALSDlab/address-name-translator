import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:name_address_translator/translateModel/favoriteModel.dart';
import 'package:name_address_translator/translateModel/translateModel.dart';
import 'package:name_address_translator/widgets/favoriteAddRemove.dart';

class AddressResultCard extends StatelessWidget {
  final JusoDetail result;

  const AddressResultCard({super.key, required this.result});

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
                  '[${result.zipNo}] ${result.roadAddr}',
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                Text(
                  result.korAddr,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                copyToClipboard('[${result.zipNo}] ${result.roadAddr}');
                const snackBar = SnackBar(content: Text('클립보드에 복사되었습니다.'),
                  duration: Duration(seconds: 1),);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(Icons.content_copy)),
          IconButton(
              onPressed: () {
                FavoriteData favoriteData = FavoriteData(
                    firstString: '[${result.zipNo}] ${result.roadAddr}',
                    secondString: result.korAddr);
                FavoriteAddRemove.addToFavoriteList(favoriteData, context);

              },
              icon: const Icon(Icons.favorite_border))
        ],
      ),
    );
  }
}

void copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}
