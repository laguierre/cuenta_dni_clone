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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: heightContainer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(radiusContainerLogin),
                      bottomLeft: Radius.circular(radiusContainerLogin)),
                  gradient: LinearGradient(colors: gradientCuentaDNI)),
              child: SvgPicture.asset(
                logoCuentaDNI,
                color: Colors.white,
                height: size.height * 0.13,
              ),
            ),
            Positioned(
                top: heightAvatar,
                child: CircleAvatar(
                  backgroundImage: AssetImage(avatarCuentaDNI),
                  radius: radiusAvatar,
                )),
            Positioned(
                top: heightAvatar + 150,
                child: Text(
                  '¡Hola Juan Carlos Perez!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                )),
            Positioned(
                top: 450,
                child: SingleChildScrollView(
                    child:
                        Column(
                          children: [
                            Container(
                              width: size.width,
                              child: _Inputs(),
                            ),
                            SizedBox(height: size.height * 0.02),
                            TextButton(onPressed: (){}, child: Text("Olvidé mi contraseña", style: TextStyle(color: Colors.black, fontSize: 20),))
                          ],
                        )


                ))

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
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
          decoration: InputDecoration(
            hintText: 'Contraseña',
        contentPadding: EdgeInsets.only(left: size.width * 0.1),
        hintStyle: TextStyle(fontSize: size.height*0.03),
        enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),
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

/*

 */
