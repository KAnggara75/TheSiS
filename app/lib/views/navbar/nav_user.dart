import 'package:flutter/material.dart';
import '../../controllers/c_navbar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class UserNavBar extends StatefulWidget {
  const UserNavBar({Key? key}) : super(key: key);

  @override
  UserNavController createState() => _UserNavBarState();
}

class _UserNavBarState extends UserNavController {
  int indexs = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        index: indexs,
        items: items,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(
            () {
              indexs = index;
            },
          );
        },
      ),
      body: screen[indexs],
    );
  }
}
