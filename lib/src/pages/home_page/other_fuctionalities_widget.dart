import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/widgets/btn_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OtherFunctionalities extends StatelessWidget {
  const OtherFunctionalities({Key? key, this.height = 50, this.width = 200})
      : super(key: key);

  final double height, width;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(bottom: 15),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radiusContainerLogin),
          color: Colors.white,
          boxShadow: [kBoxShadow],
        ),
        child: Column(children: [
          SizedBox(height: size.height * 0.015),
          Text(
            'Otras funcionalidades',
            style: TextStyle(fontSize: size.height * 0.03),
          ),
          Divider(thickness: 1, color: Colors.black),
          Expanded(
            child: _ScrollBtn(size: size),
          ),
        ]));
  }
}

class _ScrollBtn extends StatelessWidget {
  const _ScrollBtn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.055),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: size.width * 0.05),
            BtnSquareImage(
              image: 'lib/assets/images/afip.png',
              text: 'Pagos\nAFIP',
              onTap: () {},
            ),
            SizedBox(width: size.width * 0.1),
            BtnSquareImage(
              image: 'lib/assets/images/credit-cards.png',
              text: 'Otras\ncargas',
              onTap: () {},
            ),
            SizedBox(width: size.width * 0.1),
            BtnSquareImage(
              image: 'lib/assets/images/shop.png',
              text: 'Extraer en\ncomercios',
              onTap: () {},
            ),
            SizedBox(width: size.width * 0.1),
            BtnSquareImage(
              image: 'lib/assets/images/information.png',
              text: 'Pagos\nAFIP',
              onTap: () {},
            ),
            SizedBox(width: size.width * 0.055),
          ],
        ));
  }
}
