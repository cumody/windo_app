import 'package:flutter/cupertino.dart';
import 'package:windo_app/utilities/routes.dart';
import 'package:windo_app/views/pages/landingpage.dart';
import 'package:windo_app/views/pages/auth_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(builder: (_) => const AuthPage());
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(builder: (_) => const LandingPage());
  }
}
