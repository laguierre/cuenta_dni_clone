import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/utils/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height * appBarGreenPercent;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
              boxShadow: [kBoxShadow],
              gradient: LinearGradient(colors: gradientCuentaDNI),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radiusContainerLogin),
                bottomRight: Radius.circular(radiusContainerLogin),
              )),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: height * 0.57,
                  child: Container(
                    height: 2,
                    width: size.width,
                    color: Colors.white,
                  )),
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
                                    'lib/assets/images/back.png',
                                    color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    Navigator.pop(context);

                                  });
                                }),
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

                        ],
                      )),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
