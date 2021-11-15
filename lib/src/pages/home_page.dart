import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/utils/gradients.dart';
import 'package:flutter/material.dart';

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
    double height = MediaQuery.of(context).size.height * 0.25;
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
        children: [
          Positioned(
              top: 150,
              child: Container(
                height: 2,
                width: double.infinity,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
