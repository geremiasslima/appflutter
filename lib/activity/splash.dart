import 'package:flutter/material.dart';

import 'package:appflutter/main.dart';
import 'package:appflutter/util/Activity.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends ActivityState {
  @override
  void didChangeBuildContext() {
    super.didChangeBuildContext();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacementNamed("home");
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: app.PrimaryColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(bottom: 70.0),
              height: 280,
              width: 280,
              child: const Center(
                child: Text(
                  "Seja Bem Vindo!",
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: 'Aleo',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w800,
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
