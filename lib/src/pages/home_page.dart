import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/utils/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      alignment: Alignment.topCenter,
      children: [
        _AppBarHomePage(),
      ],
    )));
  }
}

class _AppBarHomePage extends StatelessWidget {
  const _AppBarHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height * 0.23;
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientCuentaDNI),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radiusContainerLogin),
            bottomRight: Radius.circular(radiusContainerLogin),
          )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: height * 0.55,
              child: Container(
                height: 2,
                width: size.width,
                color: Colors.white,
              )),
          Row(
            children: [
              FaIcon(icon: FontAwesomeIcons.hamburger),
              SvgPicture.asset(
                logoCuentaDNI,
                color: Colors.white,
                height: size.height * 0.1,
              )
            ],
          )
        ],
      ),
    );
  }
}
