import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:azapp/models/models.dart';
import 'package:azapp/screens/screens.dart';

import '../screens/login/login_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case UsersScreen.routeName:
        return UsersScreen.route(user: settings.arguments as User);
      case OnBoardingScreen.routeName:
        return OnBoardingScreen.route();
      case MatchesScreen.routeName:
        return MatchesScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case ChatScreen.routeName:
        return ChatScreen.route(userMatch: settings.arguments as UserMatch);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: const Text('error'))),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
