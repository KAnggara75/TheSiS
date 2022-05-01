import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_size/window_size.dart';
import './views/splash/splash.dart';
import './bloc/login/login_bloc.dart';
import './data/repo/auth_repo.dart';
import './data/repo/user_repo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(414, 896));
    setWindowMaxSize(Size.infinite);
    setWindowTitle("TheSiS");
  }
  runApp(App(
    loginRepository: LoginRepository(),
    userRepository: UserRepository(),
  ));
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.loginRepository,
    required this.userRepository,
  }) : super(key: key);

  final LoginRepository loginRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: loginRepository,
      child: BlocProvider(
        create: (_) => LoginBloc(
          loginRepository: loginRepository,
          userRepository: userRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            switch (state.status) {
              case LoginStatus.authenticated:
                _navigator.pushAndRemoveUntil(
                  SplashPage.route(),
                  (route) => false,
                );
                break;
              case LoginStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  SplashPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
