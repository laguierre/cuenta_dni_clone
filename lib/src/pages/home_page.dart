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
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight:
                                  Radius.circular(radiusContainerLogin),
                              bottomLeft:
                                  Radius.circular(radiusContainerLogin))),
                      width: double.infinity,
                      height: size.height * appBarWhitePercent,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: double.infinity,
                            color: kTextColor,
                            width: 1,
                          ),
                          Positioned(
                              left: 8,
                              bottom: 15,
                              child: Container(
                                padding: EdgeInsets.only(right: 15),
                                width: size.width / 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'lib/assets/images/send-money.png',
                                      height: size.height * 0.043,
                                    ),
                                    Text(
                                      'Enviar dinero',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                )),
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
    double height = MediaQuery.of(context).size.height * appBarGreenPercent;
    String account = '\$ 1000,00';
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
          _WhiteLine(height: height, size: size),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        IconButton(
                            splashColor: Colors.grey,
                            splashRadius: 30,
                            icon: Image.asset(
                                'lib/assets/images/justification.png',
                                color: Colors.white),
                            onPressed: () {}),
                      ],
                    ),
                  )),
              Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        logoCuentaDNI,
                        color: Colors.white,
                        height: size.height * 0.09,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(account,
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white)),
                          IconButton(
                              splashColor: Colors.grey,
                              splashRadius: 30,
                              icon: Image.asset(
                                'lib/assets/images/view.png',
                                color: Colors.white,
                                height: 28,
                              ),
                              onPressed: () {}),
                        ],
                      )
                    ],
                  )),
              Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          splashColor: Colors.grey,
                          splashRadius: 30,
                          icon: Image.asset(
                            'lib/assets/images/notification-bell.png',
                            color: Colors.white,
                            height: 50,
                          ),
                          onPressed: () {}),
                      FaIcon(FontAwesomeIcons.chevronRight,
                          size: 30, color: Colors.white),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class _WhiteLine extends StatelessWidget {
  const _WhiteLine({
    Key? key,
    required this.height,
    required this.size,
  }) : super(key: key);

  final double height;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: height * 0.57,
        child: Container(
          height: 2,
          width: size.width,
          color: Colors.white,
        ));
  }
}
