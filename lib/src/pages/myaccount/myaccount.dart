import 'package:cuenta_dni_clone/src/data/data.dart';
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
                  _Header(height: height, animationContainer: _animationContainer, size: size, animationOpacity: _animationOpacity, controller: _controller),
                  ///White Line///
                  _WhiteLine(height: height, animationWhiteContainer: _animationWhiteContainer, size: size),
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
                  _DataCard(size: size, animationOpacity: _animationOpacity),
                  _TextTranslate(size, height),
                ]),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.035, vertical: size.height * 0.035),
                  child: Opacity(
                    opacity: _animationOpacity.value,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
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
                                      style: TextStyle(fontSize: size.height * 0.025)),
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
                              for(int i = 0; i < SquareImageAndTextBtn.listSquareImageAndTextBtn.length; ++i)
                              BtnSquareImageAndText(
                                  image: SquareImageAndTextBtn.listSquareImageAndTextBtn[i].image,
                                  label: SquareImageAndTextBtn.listSquareImageAndTextBtn[i].label, height: size.height* 0.12, width: size.width * 0.22),
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

class _DataCard extends StatelessWidget {
  const _DataCard({
    Key? key,
    required this.size,
    required Animation<double> animationOpacity,
  }) : _animationOpacity = animationOpacity, super(key: key);

  final Size size;
  final Animation<double> _animationOpacity;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
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
                      borderRadius: BorderRadius.circular(20),
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
                        Padding(
                          padding:
                              EdgeInsets.only(top: size.height * 0.016, left: size.width*0.035),
                          child: Text(accountCA,
                              style: TextStyle(
                                  fontSize: size.height * 0.027,
                                  color: Colors.white)),
                        ),
                        SizedBox(height: size.height * 0.09),
                        _getAccountData(),
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}

class _WhiteLine extends StatelessWidget {
  const _WhiteLine({
    Key? key,
    required this.height,
    required Animation<double> animationWhiteContainer,
    required this.size,
  }) : _animationWhiteContainer = animationWhiteContainer, super(key: key);

  final double height;
  final Animation<double> _animationWhiteContainer;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height * 0.57,
      child: Opacity(
        opacity: 1 - _animationWhiteContainer.value,
        child: Container(
          height: 2,
          width: size.width,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.height,
    required Animation<double> animationContainer,
    required this.size,
    required Animation<double> animationOpacity,
    required AnimationController controller,
  }) : _animationContainer = animationContainer, _animationOpacity = animationOpacity, _controller = controller, super(key: key);

  final double height;
  final Animation<double> _animationContainer;
  final Size size;
  final Animation<double> _animationOpacity;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          padding: EdgeInsets.all(size.height * 0.015),
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
                              const Duration(seconds: 1),
                          reverseTransitionDuration:
                              const Duration(microseconds: 300),
                          pageBuilder: (context, animation,
                                  secondaryAnimation) =>
                              const HomePage(),
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
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.025, vertical: size.height * 0.003),
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

Widget _getAccountData() {
  List<Widget> getAccountDataList = [];
  for (int i = 0; i < LabelCBU.listLabelCBU.length; i++) {
    getAccountDataList.add(
      const Divider(
          thickness: 2, color: Colors.white54),
    );
    getAccountDataList.add(_label(
        label: LabelCBU.listLabelCBU[i].label,
        data: LabelCBU.listLabelCBU[i].data));
  }
  return Wrap(children: getAccountDataList);
}
