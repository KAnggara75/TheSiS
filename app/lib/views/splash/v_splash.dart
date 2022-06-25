import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../controllers/c_splash.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 95, 103),
      body: Center(
        child: Lottie.asset('assets/lottie/location.json'),
      ),
    );
  }
}
