import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:windo_app/controllers/auth_controller.dart';
import 'package:windo_app/services/auth.dart';
import 'package:windo_app/views/pages/auth_page.dart';
import 'package:windo_app/views/pages/bottom_navbar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return ChangeNotifierProvider<AuthController>(
              create: (_) => AuthController(auth: auth),
              child: const AuthPage(),
            );
          }
          return const BottomNavBar();
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
