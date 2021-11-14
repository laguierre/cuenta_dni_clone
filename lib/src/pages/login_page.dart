import 'package:cuenta_dni_clone/src/pages/home_page.dart';
import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/utils/gradients.dart';
import 'package:cuenta_dni_clone/src/widgets/btn_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _controller = ScrollController();
  bool _atEdge = false;
  double _position = 0.0;
  double _finalPos = 1.0;
  String password = "";

  @override
  void initState() {
    _controller.addListener(_listenScrolling);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _listenScrolling() {
    setState(() {
      _atEdge = false;
      if (_controller.position.atEdge) {
        _atEdge = true;
        _position = 0;
      } else {
        _position = (_controller.position.pixels / _finalPos);
        print(_position);
        if (_position >= 1) {
          _position = 1.0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double heightContainer = size.height * 0.35;
    double heightAvatar = heightContainer - radiusAvatar;
    double widthColumn = size.width * 0.8;
    double kBorderRadius = size.height * 0.015;
    setState(() {
      _finalPos = size.height * 0.47 - size.height * 0.15;
    });
    return SafeArea(
        child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(milliseconds: delayLogIn),
              builder: (BuildContext context, double value, _) {
                return CustomScrollView(controller: _controller, slivers: [
                  SliverPersistentHeader(
                    delegate: _SliverCustomHeaderDelegate(
                      minHeight: size.height * 0.15,
                      maxHeight: size.height * 0.47 + (1 - value) * size.height,
                      child: _AppBar(
                          heightContainer: heightContainer,
                          size: size,
                          value: value,
                          position: _atEdge ? 0 : _position),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: (_position) * 20),
                      Container(
                        alignment: Alignment.center,
                        child: const Text('¡Hola Juan Carlos Perez!',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(height: size.height * 0.03),
                      _PasswordLogIn(
                          size: size,
                          widthColumn: widthColumn,
                          kBorderRadius: kBorderRadius),
                    ],
                  ))
                ]);
              },
            )));
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
    required this.heightContainer,
    required this.size,
    required this.value,
    required this.position,
  }) : super(key: key);

  final double heightContainer;
  final Size size;
  final double value;
  final double position;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: heightContainer + radiusAvatar,
        child: Stack(alignment: Alignment.topCenter, children: [
          Container(
            alignment: Alignment.center,
            width: size.width,
            height: heightContainer + (1 - value) * size.height,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
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
              top: heightContainer -
                  radiusAvatar +
                  (1 - value) * size.height -
                  180 * (position),
              child: Opacity(
                opacity: (1 - 3.5 * position) < 0 ? 0.0 : 1 - 3.5 * position,
                child: CircleAvatar(
                  backgroundImage: AssetImage(avatarCuentaDNI),
                  radius: radiusAvatar * (1 - position),
                ),
              ))
        ]));
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
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        width: widthColumn,
        child: const _Inputs(),
      ),
      SizedBox(height: size.height * 0.02),
      TextButton(
        child: const Text("Olvidé mi contraseña",
            style: TextStyle(color: Colors.black, fontSize: 20)),
        onPressed: () {},
      ),
      SizedBox(height: size.height * 0.025),
      BtnGrey(
          label: 'Contraseña',
          border: kBorderRadius,
          height: size.height * 0.05,
          width: widthColumn,
          onTap: () {
            Future.delayed(
                const Duration(milliseconds: delaySplash),
                () => Navigator.of(context).pushReplacement(PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 100),
                    pageBuilder: (context, animation, _) {
                      return FadeTransition(
                        opacity: animation,
                        child: const HomePage(),
                      );
                    })));
          }),
      SizedBox(height: size.height * 0.03),
      BtnImage(
        heightBtn: 80,
        widthBtn: widthColumn,
        image: fingerPrintScan,
        colorImage: kPrimaryColor,
        border: size.height * 0.015,
        onTap: () {
          print('Hola 2');
        },
      ),
    ]);
  }
}

class _Inputs extends StatelessWidget {
  const _Inputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        counterText: 'Sin contraseña. Presionar un botón',
        hintText: 'Contraseña',
        contentPadding: EdgeInsets.only(
            left: size.width * 0.1,
            top: size.height * 0.018,
            bottom: size.height * 0.018),
        hintStyle: TextStyle(fontSize: size.height * 0.03),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 3,
              color: Colors.black,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 3, color: Colors.black)),
      ),
      onChanged: (value) {},
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => (maxHeight > minHeight) ? maxHeight : minHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => (maxHeight < minHeight) ? maxHeight : minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild

    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}
