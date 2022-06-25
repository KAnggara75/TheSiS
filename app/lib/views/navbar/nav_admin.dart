import '../../constant/size.dart';
import 'package:flutter/material.dart';
import '../../controllers/c_navbar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AdminNavBar extends StatefulWidget {
  const AdminNavBar({Key? key}) : super(key: key);

  @override
  State<AdminNavBar> createState() => _AdminNavBarState();
}

class _AdminNavBarState extends AdminNavBarController {
  int indexs = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        height: getProportionateScreenHeight(50),
        index: indexs,
        items: items,
        color: Colors.white,
        buttonBackgroundColor: const Color(0xFF06b3fa),
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(
            () {
              indexs = index;
            },
          );
        },
        letIndexChange: (index) => true,
      ),
      body: screen[indexs],
    );
  }
}
