import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/widgets/btn_widgets.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    double sizeContainerWhite = size.height * 0.18;
    double sizeAvatarDrawer = size.height * 0.050;
    double sizeWidthDrawer = isDrawerOn ? size.width * 0.92 : 0;
    double height = 65;
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(color: kBackgroundColor),
      height: size.height,
      width: sizeWidthDrawer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                height: sizeContainerWhite,
                width: sizeWidthDrawer,
                decoration: BoxDecoration(
                  boxShadow: [kBoxShadow],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(radiusContainerLogin),
                        bottomLeft: Radius.circular(radiusContainerLogin))),
                child: Stack(
                  children: [
                    Positioned(
                        left: size.width * 0.03,
                        top: sizeContainerWhite / 2 - sizeAvatarDrawer,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(avatarCuentaDNI),
                            radius: sizeAvatarDrawer)),
                    Positioned(
                        left: size.width * 0.05 + 35,
                        top: sizeContainerWhite / 2 - sizeAvatarDrawer + 55,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.white, width: 1.5),
                              shape: BoxShape.circle,
                              color: Colors.white),
                          child: Image.asset(
                            'lib/assets/images/pencil.png',
                            color: kPrimaryColor,
                            height: size.height * 0.04,
                          ),
                        )),
                    Positioned(
                        top: 20,
                        right: size.width * 0.008,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(userName,
                                    style: TextStyle(
                                        fontSize: size.height * 0.023)),
                                SizedBox(width: size.width * 0.025),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isDrawerOn = false;
                                      });
                                    },
                                    icon: Image.asset(
                                      'lib/assets/images/close.png',
                                      height: size.height * 0.03,
                                      color: kPrimaryColor,
                                    ))
                              ],
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Último Ingreso',
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '01/01/2022',
                              style: TextStyle(
                                  fontSize: size.height * 0.021,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: size.height * 0.01),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BtnRectangleImage(
                      width: sizeWidthDrawer,
                      height: height,
                      label: 'Cambiar contraseña',
                      image: 'lib/assets/images/refresh.png',
                      onTap: () {},
                    ),
                    Divider(thickness: 1),
                    BtnRectangleImage(
                      width: sizeWidthDrawer,
                      height: height,
                      label: 'Contacto',
                      image: 'lib/assets/images/contact.png',
                      onTap: () {},
                    ),
                    Divider(thickness: 1),
                    BtnRectangleImage(
                      width: sizeWidthDrawer,
                      height: height,
                      label: 'Validar Telefono',
                      image: 'lib/assets/images/mobile2.png',
                      onTap: () {},
                    ),
                    Divider(thickness: 1),
                    BtnRectangleImage(
                      width: sizeWidthDrawer,
                      height: height,
                      label: 'Validar correo electrónico',
                      image: 'lib/assets/images/mail.png',
                      onTap: () {},
                    ),
                    Divider(thickness: 1),
                    BtnRectangleImage(
                      width: sizeWidthDrawer,
                      height: height,
                      label: 'Alta usuario BIP',
                      image: 'lib/assets/images/user.png',
                      onTap: () {},
                    ),
                    Divider(thickness: 1),
                    BtnRectangleImage(
                      width: sizeWidthDrawer,
                      height: height,
                      label: 'Legales',
                      image: 'lib/assets/images/agreement.png',
                      onTap: () {},
                    ),
                    //Divider(thickness: 1),
                  ],
                ),
              )),
          Divider(thickness: 1),
          BtnRectangleImage(
            width: sizeWidthDrawer,
            height: 80,
            label: 'Cerrar sesión',
            image: 'lib/assets/images/logout.png',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}