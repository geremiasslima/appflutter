import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'package:appflutter/activity/home.dart';
import 'package:appflutter/activity/splash.dart';

Future<void> main() async {
  //Inicializa o aplicativo

  runApp(const app());
}

class app extends StatelessWidget {
  const app();

  static String title = "MEU APP";
  static Color PrimaryColor = Color(0xFF2196F3);
  static Color PrimaryColorLetter = Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: PrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
      routes: {
        'home': (context) => Home(),
        'splash': (context) => Splash(),
      },
    );
  }
}
