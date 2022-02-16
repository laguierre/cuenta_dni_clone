import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/widgets/btn_widgets.dart';
import 'package:flutter/material.dart';
import 'package:cuenta_dni_clone/src/data/data.dart';


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
      margin: EdgeInsets.only(left: 0),
      decoration: BoxDecoration(color: kBackgroundColor),
      height: size.height,
      width: sizeWidthDrawer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   _getCustomDrawer(sizeWidthDrawer, height),
                  ],
                ),
              )),
          const Divider(thickness: 1),
          BtnRectangleImage(
            width: sizeWidthDrawer,
            height: 80,
            label: CustomDrawerClass.listCustomDrawer[CustomDrawerClass.listCustomDrawer.length-1].label,
            image: CustomDrawerClass.listCustomDrawer[CustomDrawerClass.listCustomDrawer.length-1].image,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget _getCustomDrawer(double width, height) {
  List<Widget> getCustomDrawerList = [];
  for (int i = 0; i < CustomDrawerClass.listCustomDrawer.length-1; i++) {
    getCustomDrawerList.add(BtnRectangleImage(
      width: width,
      height: height,
      label: CustomDrawerClass.listCustomDrawer[i].label,
      image: CustomDrawerClass.listCustomDrawer[i].image,
      onTap: () {},
    ));
    getCustomDrawerList.add(const Divider(thickness: 1));
  }
  return Column(mainAxisAlignment: MainAxisAlignment.start,children: getCustomDrawerList);
}
