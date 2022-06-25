import './c_auth.dart';
import './c_navbar.dart';
import '../constant/size.dart';
import 'package:flutter/material.dart';
import '../views/splash/v_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: SplashView(),
    );
  }
}

abstract class SplashController extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      getPref();
    });
    super.initState();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      int? status = preferences.getInt("status");
      if (status == 2) {
        Navigator.pushReplacementNamed(context, UserScreen.routeName);
      } else if (status == 1) {
        Navigator.pushReplacementNamed(context, AdminScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
    });
  }
}
