import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FavoriteScreen extends StatefulWidget {
   const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late final _favorites;


  @override
  void initState() {
    super.initState();

    // SharedPreferences에서 즐겨찾기를 가져옵니다.
    SharedPreferences.getInstance().then((prefs) {
      _favorites = prefs.getStringList('favorites')?.map((e) {
        return json.decode(e);
      }).toList() ?? [];
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
      body: Stack(
        children: [const Opacity(
          opacity: 0.1,
          child: Center(
            child: Icon(Icons.favorite_border, size: 300),
          ),
        ),


          ListView.builder(
            itemCount: _favorites.length,
            itemBuilder: (context, index) {
              final favorite = _favorites[index];

              return ListTile(
                title: Text(favorite['name']),
                subtitle: Text(favorite['address']),
              );
            },
          ),





        ]
      ),

    );
  }
}
