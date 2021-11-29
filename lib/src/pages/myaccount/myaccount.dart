import 'package:cuenta_dni_clone/src/pages/home_page/home_page.dart';
import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/utils/gradients.dart';
import 'package:cuenta_dni_clone/src/widgets/btn_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage>
    with TickerProviderStateMixin {
  late Animation<double> _animationOpacity;
  late Animation<double> _animationContainer;
  late Animation<double> _animationWhiteContainer;

  late AnimationController _controllerWhiteLine;
  late AnimationController _controller;
  double _value = 0.0;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _controllerWhiteLine = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _animationOpacity = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _animationContainer =
        Tween<double>(begin: 0, end: -80).animate(_controller);

    _animationWhiteContainer =
        Tween<double>(begin: 0, end: 1).animate(_controllerWhiteLine);

    _controller.forward();
    _controllerWhiteLine.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height * appBarGreenPercent;

    return SafeArea(
        child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: Column(
              children: [
                Stack(children: [
                  ///Header///
                  Container(
                    width: double.infinity,
                    height: height + _animationContainer.value,
                    decoration: BoxDecoration(
                        boxShadow: [kBoxShadow],
                        gradient: LinearGradient(colors: gradientCuentaDNI),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(radiusContainerLogin),
                          bottomRight: Radius.circular(radiusContainerLogin),
                        )),
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(children: [
                              Opacity(
                                opacity: (1 - _animationOpacity.value),
                                child: IconButton(
                                    splashColor: Colors.grey,
                                    splashRadius: 30,
                                    icon: Image.asset(
                                        'lib/assets/images/justification.png',
                                        color: Colors.white),
                                    onPressed: () {}),
                              ),
                              Opacity(
                                opacity: _animationOpacity.value,
                                //_animationOpacity.value,
                                child: IconButton(
                                    splashColor: Colors.grey,
                                    splashRadius: 30,
                                    icon: Image.asset(
                                        'lib/assets/images/back.png',
                                        color: Colors.white),
                                    onPressed: () {
                                      _controller.reverse();
                                      Navigator.of(context)
                                          .push(PageRouteBuilder(
                                        transitionDuration:
                                            Duration(seconds: 1),
                                        reverseTransitionDuration:
                                            Duration(microseconds: 300),
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            HomePage(),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          final tween =
                                              Tween(begin: 0.0, end: 1.0);
                                          final fadeAnimation =
                                              animation.drive(tween);
                                          return FadeTransition(
                                            opacity: fadeAnimation,
                                            child: child,
                                          );
                                        },
                                      ));
                                    }),
                              ),
                            ]),
                            SvgPicture.asset(
                              logoCuentaDNI,
                              color: Colors.white,
                              height: size.height * 0.09,
                            ),
                            Opacity(
                                opacity: (1 - _animationOpacity.value),
                                child: IconButton(
                                    splashColor: Colors.grey,
                                    splashRadius: 30,
                                    icon: Image.asset(
                                      'lib/assets/images/notification-bell.png',
                                      color: Colors.white,
                                      height: 50,
                                    ),
                                    onPressed: () {})),
                          ],
                        ),
                      ),
                    ]),
                  ),

                  ///White Line///
                  Positioned(
                    top: height * 0.57,
                    child: Opacity(
                      opacity: 1 - _animationWhiteContainer.value,
                      child: Container(
                        height: 2,
                        width: size.width,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    right: size.width * 0.075,
                    top: size.height * 0.16,
                    child: Opacity(
                      opacity: 1 - _animationOpacity.value,
                      child: const FaIcon(FontAwesomeIcons.chevronRight,
                          size: 30, color: Colors.white),
                    ),
                  ),

                  ///Data Card///
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Opacity(
                        opacity: _animationOpacity.value,
                        child: Stack(
                          children: [
                            Transform.scale(
                              ///White Container///
                              scale: _animationOpacity.value,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: size.height *
                                            0.40 *
                                            _animationOpacity.value +
                                        size.height *
                                            0.25 *
                                            (1 - _animationOpacity.value)),
                                height: (size.height *
                                    0.15 *
                                    _animationOpacity.value),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.white,
                                    boxShadow: [kBoxShadow]),
                                child: Container(
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.065),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'lib/assets/images/share.png',
                                        height: size.height * 0.04,
                                      ),
                                      const Text(
                                        'Compartar datos de la cuenta',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: size.height * 0.15),
                              height: (size.height *
                                  0.32 *
                                  _animationOpacity.value),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient:
                                      LinearGradient(colors: gradientCuentaDNI),
                                  boxShadow: [kBoxShadow]),
                              child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 18, left: 19),
                                        child: Text(accountCA,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)),
                                      ),
                                      SizedBox(height: size.height * 0.09),
                                      const Divider(
                                          thickness: 2, color: Colors.white54),
                                      const _label(
                                          label: 'Alias',
                                          data: 'PAPA.PIPO.POPO'),
                                      const Divider(
                                          thickness: 2, color: Colors.white54),
                                      const _label(
                                          label: 'CBU',
                                          data: '454546554753455674'),
                                      const Divider(
                                          thickness: 2, color: Colors.white54),
                                      const _label(
                                          label: 'CUIL', data: '2045584545'),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      )),
                  _TextTranslate(size, height),

                  ///Text Money Account///
                  /*Positioned(
                    bottom: 20,
                    child: Slider(
                      value: _value,
                      //label: _value.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  )*/
                ]),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 25),
                  child: Opacity(
                    opacity: _animationOpacity.value,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              height: size.height * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'lib/assets/images/credit-card.png',
                                    color: kPrimaryColor,
                                    height: size.height * 0.05,
                                  ),
                                  Text('Cambiar cuenta principal',
                                      style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Text('Cargar saldo en tu cuenta',
                              style: TextStyle(fontSize: size.height * 0.02)),
                          SizedBox(height: size.height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BtnSquareImageAndText(
                                  image: 'lib/assets/images/sharing.png',
                                  label: 'Solicitar a\notro usuario'),
                              BtnSquareImageAndText(
                                  image: 'lib/assets/images/bank.png',
                                  label: 'Sucursal\nBanco'),
                              BtnSquareImageAndText(
                                  image: 'lib/assets/images/transfer.png',
                                  label: 'Transferencia'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )));
  }

  Transform _TextTranslate(Size size, double height) {
    return Transform.translate(
      offset: Offset(_animationOpacity.value * -size.width * 0.155,
          _animationOpacity.value * size.width * 0.13),
      child: Container(
        margin: EdgeInsets.only(top: height * 0.655),
        child: Transform.scale(
          scale: (1 - _animationOpacity.value).toDouble().clamp(0.9, 1.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isShowMoney
                      ? Text(account,
                          style: TextStyle(
                              fontSize: size.width * 0.1, color: Colors.white))
                      : Text('Saldo Oculto',
                          style: TextStyle(
                              fontSize: size.width * 0.085,
                              color: Colors.white)),
                  IconButton(
                      splashColor: Colors.grey,
                      splashRadius: 30,
                      icon: isShowMoney
                          ? Image.asset('lib/assets/images/view.png',
                              color: Colors.white, height: 28)
                          : Image.asset('lib/assets/images/hide.png',
                              color: Colors.white, height: 28),
                      onPressed: () {
                        setState(() {
                          isShowMoney = !isShowMoney;
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _label extends StatelessWidget {
  const _label({Key? key, required this.label, required this.data})
      : super(key: key);

  final String label, data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizeFont = size.height * 0.023;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 1,
              child: Text(label,
                  style: TextStyle(color: Colors.white, fontSize: sizeFont))),
          Expanded(
              flex: 3,
              child: Text(data,
                  style: TextStyle(color: Colors.white, fontSize: sizeFont))),
          Image.asset(
            'lib/assets/images/file.png',
            color: Colors.white,
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
