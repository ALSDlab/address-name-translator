import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:name_address_translator/screens/addressTranslateScreen.dart';
import 'package:name_address_translator/screens/favoriteScreen.dart';
import 'package:name_address_translator/widgets/AddressResultCard.dart';
import 'package:name_address_translator/widgets/favoriteCard.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AddressTranslateScreen(),
    ),
    GoRoute(
      path: '/favorite',
      builder: (context, state) {
        // jsonString 으로 넘겨 받는 방식
        final favorite =
        FavoriteData.fromJson(jsonDecode(state.uri.queryParameters['BmiVar']!));
        // Object로 넘겨 받는 방식
        // final person = state.extra! as Person;

        return FavoriteCard(favorite: favorite);
      },
    ),
  ],
);