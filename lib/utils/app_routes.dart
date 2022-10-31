import 'package:flutter/material.dart';
import 'package:note/screens/descritption_page.dart';
import 'package:note/screens/login_page.dart';
import 'package:note/screens/main_page.dart';
import 'package:note/screens/onboarding_page.dart';
import 'package:note/screens/register_page.dart';
import 'package:note/screens/splash_page.dart';
import 'package:note/screens/welcome_page.dart';

abstract class RoutName {
  static const splash = 'splash';
  static const onBoarding = 'on_boarding';
  static const register = 'register';
  static const logIn = 'log_in';
  static const welcome = 'welcome';
  static const main = 'main';
  static const description = 'description';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RoutName.onBoarding:
        return MaterialPageRoute(builder: (_) => OnboardinPage());
      case RoutName.welcome:
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case RoutName.logIn:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RoutName.register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case RoutName.main:
        return MaterialPageRoute(builder: (_) => MainPage());
      case RoutName.description:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => DescriptionPage(
            model: args['toDoModel'],
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
