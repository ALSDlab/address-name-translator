import 'package:flutter/material.dart';
import 'package:name_address_translator/translateModel/favoriteModel.dart';
import 'package:name_address_translator/widgets/AddressResultCard.dart';
import 'package:name_address_translator/widgets/favoriteAddRemove.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key, required this.favorite, required this.onRemove});

  final FavoriteData favorite;
  final VoidCallback onRemove;

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
                  favorite.firstString,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                Text(
                  favorite.secondString,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                copyToClipboard(favorite.firstString);
                const snackBar = SnackBar(content: Text('클립보드에 복사되었습니다.'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(Icons.content_copy)),
          IconButton(
              onPressed: () {
                onRemove();
                FavoriteAddRemove.removeFromFavoriteList(favorite);
                const snackBar = SnackBar(content: Text('삭제되었습니다.'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

              },
              icon: const Icon(Icons.delete_outline_rounded))
        ],
      ),
    );
  }
}
