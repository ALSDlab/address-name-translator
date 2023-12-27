import 'package:flutter/material.dart';
import 'package:name_address_translator/widgets/AddressResultCard.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leadingWidth: 90,
        leading: const Text(
          '즐겨찾기',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
      ),
      body: Stack(children: [
        const Opacity(
          opacity: 0.1,
          child: Center(
            child: Icon(Icons.favorite_border, size: 300),
          ),
        ),
        ListView.builder(
          itemCount: favoriteList.length,
          itemBuilder: (context, index) {
            final favorite = favoriteList[index];

            return FavoriteCard(favorite: favorite);
          },
        ),
      ]),
    );
  }
}



