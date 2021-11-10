import 'package:cuenta_dni_clone/src/pages/login_page.dart';
import 'package:cuenta_dni_clone/src/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cuenta DNI Clone',
      home: LogInPage(),
    );
  }
}

