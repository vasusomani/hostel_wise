import 'package:flutter/material.dart';

import '../Pages/LandingPage.dart';
import '../Pages/SignInPage.dart';
import '../Pages/SignUpPage.dart';

class Routes extends NavigatorObserver {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignInPage());
    }
    return null;
  }
}
