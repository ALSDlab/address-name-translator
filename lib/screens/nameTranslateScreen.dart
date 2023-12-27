import 'package:flutter/material.dart';

class NameTranslateScreen extends StatefulWidget {
  const NameTranslateScreen({super.key});

  @override
  State<NameTranslateScreen> createState() => _FriendsScreen();
}

class _FriendsScreen extends State<NameTranslateScreen> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Opacity(
          opacity: 0,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.greenAccent,
              leadingWidth: 90,
              leading: Text(
                '이름변환',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            )
          ],
        )
      ],
    );
  }
}
