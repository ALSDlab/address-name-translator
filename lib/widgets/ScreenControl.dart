import 'package:flutter/material.dart';
import 'package:name_address_translator/screens/addressTranslateScreen.dart';
import 'package:name_address_translator/screens/favoriteScreen.dart';
import 'package:name_address_translator/screens/nameTranslateScreen.dart';

class ScreenControl extends StatefulWidget {
  const ScreenControl({super.key});

  @override
  State<ScreenControl> createState() => _ScreenControlState();
}

class _ScreenControlState extends State<ScreenControl> {
  var _index = 0;
  final _pages = [
    // const NameTranslateScreen(),
    const AddressTranslateScreen(),
    const FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white,
                  BlendMode.dstATop,
                ),
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.8),
          ),
          _pages[_index],
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
            currentIndex: _index,
            backgroundColor: const Color(0xff19ddcb),
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              // BottomNavigationBarItem(
              //   label: '이름변환',
              //   icon: Icon(Icons.translate_rounded),
              // ),
              BottomNavigationBarItem(
                label: '주소변환',
                icon: Icon(Icons.maps_home_work_rounded),
              ),
              BottomNavigationBarItem(
                label: '즐겨찾기',
                icon: Icon(Icons.favorite_border_rounded),
              ),
            ],
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.redAccent,
            selectedLabelStyle: const TextStyle(fontFamily: 'Dohyeon'),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Dohyeon'),
          ),
        ),
      ),
    );
  }
}
