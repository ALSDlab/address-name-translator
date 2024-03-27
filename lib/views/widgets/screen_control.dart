import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:name_address_translator/viewmodels/screen_control_viewmodel.dart';
import 'package:name_address_translator/views/screens/address_translate_screen.dart';
import 'package:name_address_translator/views/screens/favorite_screen.dart';
import 'package:name_address_translator/views/screens/name_translate_screen.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/di/di_setup.dart';
import '../../viewmodels/address_translate_viewmodel.dart';
import '../../viewmodels/name_translate_viewmodel.dart';

class ScreenControl extends StatefulWidget {
  const ScreenControl({super.key});

  @override
  State<ScreenControl> createState() => _ScreenControlState();
}

class _ScreenControlState extends State<ScreenControl> {
  final _pages = [
    ChangeNotifierProvider(
      create: (_) => getIt<AddressTranslateViewmodel>(),
      child: const AddressTranslateScreen(),
    ),
    ChangeNotifierProvider(
      create: (_) => getIt<NameTranslateViewmodel>(),
      child: const NameTranslateScreen(),
    ),
    const FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    TargetPlatform os = Theme.of(context).platform;

    BannerAd banner = BannerAd(
      listener: BannerAdListener(
        onAdFailedToLoad: (Ad ad, LoadAdError error) {},
        onAdLoaded: (_) {},
      ),
      size: AdSize.banner,
      adUnitId: UNIT_ID[os == TargetPlatform.iOS ? 'ios' : 'android']!,
      request: AdRequest(),
    )..load();


    int index = Provider.of<ScreenIndexProvider>(context).currentIndex;
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
          _pages[index],
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
                  Provider.of<ScreenIndexProvider>(context, listen: false)
                      .setIndex(index);
                },
                currentIndex: index,
                backgroundColor: const Color(0xff19ddcb),
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    label: '주소변환',
                    icon: Icon(Icons.maps_home_work_rounded),
                  ),
                  BottomNavigationBarItem(
                    label: '이름변환',
                    icon: Icon(Icons.person),
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
            SizedBox(
              width: double.infinity,
              height: 60,
              child: AdWidget(
                ad: banner,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
