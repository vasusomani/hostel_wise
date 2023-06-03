import 'package:flutter/material.dart';
import 'package:hostel_wise/Pages/IntroPage.dart';

import '../Pages/LandingPage.dart';
import '../Pages/SignInPage.dart';
import '../Pages/SignUpPage.dart';

class Routes extends NavigatorObserver {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/intro':
        return MaterialPageRoute(builder: (_) => IntroPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignInPage());
    }
    return null;
  }
}
