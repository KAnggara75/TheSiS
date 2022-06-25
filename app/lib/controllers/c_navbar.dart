import 'package:flutter/material.dart';
import 'package:thesis/views/board/v_board.dart';
import 'package:thesis/views/home/v_home.dart';
import '../views/navbar/nav_user.dart';
import '../views/profile/v_profile.dart';
import '../views/navbar/nav_admin.dart';

class AdminScreen extends StatelessWidget {
  static String routeName = '/admin';

  const AdminScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AdminNavBar(),
    );
  }
}

class UserScreen extends StatelessWidget {
  static String routeName = '/user';
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UserNavBar();
  }
}

abstract class AdminNavBarController extends State<AdminNavBar> {
  int pageIndex = 0;

  final items = <Widget>[
    const Icon(Icons.home, size: 30),
    const Icon(Icons.view_quilt_rounded, size: 30),
    const Icon(Icons.two_wheeler, size: 30),
    const Icon(Icons.person, size: 30),
  ];

  final screen = [
    const HomeBody(),
    const BoardPage(),
    const ProfileBody(),
    const ProfileBody(),
  ];
}

abstract class UserNavController extends State<UserNavBar> {
  int pageIndex = 0;

  Widget showPage = const ProfileBody();

  final screen = [
    const ProfileBody(),
    const ProfileBody(),
    const ProfileBody(),
    const ProfileBody(),
  ];

  final items = <Widget>[
    const Icon(Icons.home, size: 30),
    const Icon(Icons.view_quilt_rounded, size: 30),
    const Icon(Icons.two_wheeler, size: 30),
    const Icon(Icons.person, size: 30),
  ];
}
