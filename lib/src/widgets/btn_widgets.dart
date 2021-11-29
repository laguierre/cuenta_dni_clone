import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BtnGrey extends StatelessWidget {
  BtnGrey({
    Key? key,
    required this.border,
    required this.label,
    required this.onTap,
    this.color = const Color(0xFFBBBBBB),
    required this.width,
    required this.height,
  }) : super(key: key);

  final double border;
  final String label;
  final VoidCallback onTap;
  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(border/4),
          bottomRight: Radius.circular(border/4),
          bottomLeft: Radius.circular(border),
          topRight: Radius.circular(border)),
      child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(border/4),
                  bottomRight: Radius.circular(border/4),
                  bottomLeft: Radius.circular(border),
                  topRight: Radius.circular(border))),
          child: Text(label,
              style: TextStyle(color: Colors.white, fontSize: 22))),
      onTap: onTap,
    );
  }

}

class BtnImage extends StatelessWidget {
  const BtnImage(
      {Key? key,
      this.border = 30,
      required this.image,
      this.widthBtn = 350,
      this.heightBtn = 80,
      this.widthImage = 40,
      this.heightImage = 40,
      required this.colorImage,
      this.colorBtn = Colors.white,
      required this.onTap})
      : super(key: key);

  final double border;
  final String image;
  final double widthBtn;
  final double heightBtn;
  final double widthImage;
  final double heightImage;
  final Color colorImage;
  final Color colorBtn;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(border),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
            borderRadius: BorderRadius.circular(border),
            highlightColor: Colors.red.withOpacity(0.5),
            splashColor: Colors.red.withOpacity(0.5),
            onTap: onTap,
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: widthBtn * 0.03),
                width: widthBtn,
                height: heightBtn,
                decoration: BoxDecoration(
                    color: colorBtn,
                    borderRadius: BorderRadius.circular(border)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        image,
                        height: heightImage,
                        color: colorImage,
                      ),
                      Text(
                        'Ingresar con huella',
                        style: TextStyle(fontSize: heightBtn * 0.32),
                      )
                    ]))));
  }
}

class BtnSquareImage extends StatelessWidget {
  BtnSquareImage(
      {Key? key,
      this.squareSize = 60,
      required this.image,
      required this.text,
      required this.onTap})
      : super(key: key);

  final double squareSize;
  final String image, text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
              borderRadius: BorderRadius.circular(10),
              highlightColor: Colors.red.withOpacity(0.5),
              splashColor: Colors.red.withOpacity(0.5),
              onTap: onTap,
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8.5),
                  width: squareSize,
                  height: squareSize,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    image,
                    color: kPrimaryColor,
                  ))),
        ),
        SizedBox(height: 10),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }
}

class FAB extends StatelessWidget {
  const FAB(
      {Key? key,
      this.width = 100,
      this.height = 30,
      required this.image,
      required this.label,
      required this.onTap})
      : super(key: key);

  final double width, height;
  final String image, label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(radiusContainerLogin / 6),
          bottomRight: Radius.circular(radiusContainerLogin / 6),
          topRight: Radius.circular(radiusContainerLogin / 2),
          bottomLeft: Radius.circular(radiusContainerLogin / 2)),
      //clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(radiusContainerLogin / 6),
            bottomRight: Radius.circular(radiusContainerLogin / 6),
            topRight: Radius.circular(radiusContainerLogin / 2),
            bottomLeft: Radius.circular(radiusContainerLogin / 2)),
        highlightColor: Colors.red.withOpacity(0.5),
        splashColor: Colors.red.withOpacity(0.5),
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [kBoxShadow],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radiusContainerLogin / 6),
                  bottomRight: Radius.circular(radiusContainerLogin / 6),
                  topRight: Radius.circular(radiusContainerLogin / 2),
                  bottomLeft: Radius.circular(radiusContainerLogin / 2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                image,
                color: Colors.white,
                height: size.height * 0.05,
              ),
              Text(label,
                  style: TextStyle(
                      fontSize: size.height * 0.02, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

class BtnRectangleImage extends StatelessWidget {
  const BtnRectangleImage(
      {Key? key,
      required this.image,
      required this.label,
      required this.onTap,
      this.height = 100,
      this.width = 200,})
      : super(key: key);

  final String image, label;
  final VoidCallback onTap;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: height,
      width: width,
      color: Colors.transparent,
      child: Row(
        children: [
          Image.asset(image, height: size.height * 0.032,),
          SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(fontSize: size.height * 0.025),
          )
        ],
      ),
    );
  }
}

class BtnSquareImageAndText extends StatelessWidget {
  const BtnSquareImageAndText({Key? key, this.height = 100, this.width = 100, required this.label, required this.image}) : super(key: key);

  final double height,width;
  final String label, image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(size.height * 0.015), boxShadow: [kBoxShadow]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image, height: size.height * 0.05, color: kPrimaryColor),
          Text(label, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(fontSize: size.height * 0.016)),
        ],
      ),
    );
  }
}
