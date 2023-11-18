import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:windo_app/services/auth.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'package:windo_app/utilities/router.dart';
import 'package:windo_app/utilities/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Windo App',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF9F9F9),
          primaryColor: Colors.red,
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: Theme.of(context).textTheme.titleMedium,
            focusedBorder: _getOutlinedBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )),
            disabledBorder: _getOutlinedBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )),
            enabledBorder: _getOutlinedBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )),
            errorBorder: _getOutlinedBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )),
            focusedErrorBorder: _getOutlinedBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                )),
          ),
        ),
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.landingPageRoute,
      ),
    );
  }
}

OutlineInputBorder _getOutlinedBorder({
  required BorderRadius borderRadius,
  required BorderSide borderSide,
}) {
  return OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: borderSide,
  );
}
