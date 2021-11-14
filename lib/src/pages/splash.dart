import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/utils/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: delaySplash),
        () => Navigator.of(context).pushReplacement(PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, _) {
              return FadeTransition(
                opacity: animation,
                child: const LogInPage(),
              );
            })));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: gradientCuentaDNI,
                ),
              )),
          Center(
            child: SvgPicture.asset(logoCuentaDNI,
                color: Colors.white, height: size.height * 0.12),
          ),
          Positioned(
              bottom: (size.height / 2) * 0.43,
              child: Container(
                width: size.width,
                alignment: Alignment.topCenter,
                child: Text(
                  'Inicializando...',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
          Positioned(
              bottom: (size.height / 2) * 0.3,
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                child: CircularProgressIndicator(
                    color: Colors.white, backgroundColor: kPrimaryColor,),
              )),
          Positioned(
              bottom: 50,
              child: Container(
                padding: EdgeInsets.only(right: 20),
                width: size.width,
                alignment: Alignment.centerRight,
                child: Text(
                  'version: 7.1.0',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              )),
        ],
      ),
    );
  }
}
