import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:window_size/window_size.dart';

import './configs/routes.dart';
import './configs/themes.dart';
import './constant/text.dart';
import './controllers/c_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows) {
    if (!kIsWeb) {
      setWindowMinSize(const Size(360, 720));
      setWindowMaxSize(Size.infinite);
      setWindowTitle("TheSiS");
    }
  }
  // SdkContext.init(IsolateOrigin.main);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Disable Debud banner on right top app
      title: appName,
      theme: theme(), //Theme for this App
      initialRoute: SplashScreen.routeName, //Redirect to Splash Screen
      routes: routes, //Setup Routes from routers.dart
    );
  }
}
