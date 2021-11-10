import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/utils/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    double heightContainer = size.height * 0.35;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: size.height * 0.08),
              width: double.infinity,
              height: heightContainer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(radiusContainerLogin),
                      bottomLeft: Radius.circular(radiusContainerLogin)),
                  gradient: LinearGradient(colors: gradientCuentaDNI)),
              child: Column(children: [
                SvgPicture.asset(logoCuentaDNI,
                    color: Colors.white, height: size.height * 0.12)
              ],),
            ),

              /*Positioned(
            top: size.height * 0.1,
            child:
        Positioned(
            top: heightContainer - radiusAvatar,
            child: const CircleAvatar(
              backgroundImage: AssetImage(avatarCuentaDNI),
              radius: 55,
            )),
        Positioned(
          top: (heightContainer - radiusAvatar) + 150,
          child: Text(
            '¡Hola Juan Carlos Perez!',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),*/

            ));
  }
}

class _Inputs extends StatelessWidget {
  const _Inputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 3,
                  color: Colors.black,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 3, color: Colors.black)),
          )),
    );
  }
}
