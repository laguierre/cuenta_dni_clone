import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/utils/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double heightContainer = size.height * 0.35;
    double heightAvatar = heightContainer - radiusAvatar;
    double widthColumn = size.width * 0.8;
    double kBorderRadius = size.height * 0.015;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: heightContainer,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(radiusContainerLogin),
                        bottomLeft: Radius.circular(radiusContainerLogin)),
                    gradient: LinearGradient(colors: gradientCuentaDNI)),
                child: SvgPicture.asset(logoCuentaDNI,
                    color: Colors.white, height: size.height * 0.13)),
            Positioned(
                top: heightAvatar,
                child: const CircleAvatar(
                  backgroundImage: AssetImage(avatarCuentaDNI),
                  radius: radiusAvatar,
                )),
            Positioned(
                top: heightAvatar + 150,
                child: const Text(
                  '¡Hola Juan Carlos Perez!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                )),
            _PasswordLogIn(
                size: size,
                widthColumn: widthColumn,
                kBorderRadius: kBorderRadius),
          ],
        ),
      ),
    );
  }
}

class _PasswordLogIn extends StatelessWidget {
  const _PasswordLogIn({
    Key? key,
    required this.size,
    required this.widthColumn,
    required this.kBorderRadius,
  }) : super(key: key);

  final Size size;
  final double widthColumn;
  final double kBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.55,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: widthColumn,
              child: const _Inputs(),
            ),
            SizedBox(height: size.height * 0.02),
            TextButton(
              child: const Text("Olvidé mi contraseña",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              onPressed: () {},
            ),
            SizedBox(height: size.height * 0.04),
            Container(
                alignment: Alignment.center,
                width: widthColumn,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.65),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(kBorderRadius),
                        topRight: Radius.circular(kBorderRadius))),
                child: const Text('Ingresar',
                    style: TextStyle(color: Colors.white, fontSize: 22))),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              width: widthColumn,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kBorderRadius)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    fingerPrintScan,
                    height: size.height * 0.06,
                    color: kPrimaryColor,
                  ),
                  Text(
                    'Ingresar con huella',
                    style: TextStyle(fontSize: size.height * 0.022),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Inputs extends StatelessWidget {
  const _Inputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      child: TextField(
          decoration: InputDecoration(
        hintText: 'Contraseña',
        contentPadding: EdgeInsets.only(
            left: size.width * 0.1,
            top: size.height * 0.018,
            bottom: size.height * 0.018),
        hintStyle: TextStyle(fontSize: size.height * 0.03),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 3,
              color: Colors.black,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 3, color: Colors.black)),
      )),
    );
  }
}

/*

 */
