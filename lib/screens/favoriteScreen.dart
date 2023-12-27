import 'package:flutter/material.dart';
import 'package:name_address_translator/translateModel/favoriteModel.dart';
import 'package:name_address_translator/widgets/favoriteAddRemove.dart';
import 'package:name_address_translator/widgets/favoriteCard.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<FavoriteData> favoriteList = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    List<FavoriteData> favorites = await FavoriteAddRemove.getFavoriteList();
    setState(() {
      favoriteList = favorites;
    });
  }

  void _removeFromFavorites(FavoriteData item) async {
    await FavoriteAddRemove.removeFromFavoriteList(item);
    // 삭제 후에는 다시 목록을 불러올 수 있도록 _loadFavorites 메서드 호출
    setState(() {
      _loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: const Color(0xff19ddcb),
        leadingWidth: 200,
        leading: const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            '즐겨찾기',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontFamily: 'Dohyeon'),
          ),
        ),
      ),
      body: Stack(children: [
        const Opacity(
          opacity: 0.1,
          child: Center(
            child: Icon(Icons.favorite_border, size: 300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: favoriteList.length,
            itemBuilder: (context, index) {
              final favorite = favoriteList[index];

              return FavoriteCard(
                favorite: favorite,
                onRemove: () => _removeFromFavorites(favorite),
              );
            },
          ),
        ),
      ]),
    );
  }
}
