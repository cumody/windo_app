import 'package:flutter/cupertino.dart';
import 'package:windo_app/utilities/routes.dart';
import 'package:windo_app/views/pages/bottom_navbar.dart';
import 'package:windo_app/views/pages/landingpage.dart';
import 'package:windo_app/views/pages/auth_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );
    case AppRoutes.bottomNavBar:
      return CupertinoPageRoute(
        builder: (_) => const BottomNavBar(),
        settings: settings,
      );
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
  }
}
