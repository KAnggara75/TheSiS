import 'package:flutter/widgets.dart';
import 'package:thesis/controllers/c_auth.dart';
import 'package:thesis/controllers/c_navbar.dart';
import '../controllers/c_splash.dart';

final Map<String, WidgetBuilder> routes = {
  UserScreen.routeName: (context) => const UserScreen(),
  AdminScreen.routeName: (context) => const AdminScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
};
