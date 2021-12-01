import 'package:cuenta_dni_clone/src/data/data.dart';
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
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            SizedBox(width: size.width * 0.025),
            _getBanner(size),
          ],
        ));
  }
}

Widget _getBanner(Size size) {
  List<Widget> getBannerList = [];
  for (int i = 6; i < SquareImageBtn.listSquareImageBtn.length; i++) {
    getBannerList.add(
      BtnSquareImage(
        image: SquareImageBtn.listSquareImageBtn[i].image,
        text: SquareImageBtn.listSquareImageBtn[i].text,
        onTap: () {},
      ),
    );
    getBannerList.add(SizedBox(width: size.width * 0.1));
  }
  return Wrap(children: getBannerList);
}
