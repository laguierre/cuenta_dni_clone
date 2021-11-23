import 'package:cuenta_dni_clone/src/pages/home_page/other_fuctionalities_widget.dart';
import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/utils/gradients.dart';
import 'package:cuenta_dni_clone/src/widgets/btn_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

bool isDrawerOn = false;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final PageController _pageController = PageController(initialPage: 0);

    double height = MediaQuery.of(context).size.height * appBarGreenPercent;
    String account = '\$ 1000,00';

    return SafeArea(
        child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: Stack(
              //alignment: Alignment.topCenter,
              children: [
                _SingleScrollView(size: size, pageController: _pageController),
                _AppBarHomePage(height, size, account),
                Positioned(right: 20, bottom: 20, child: FAB(
                  label: 'Pagar QR',
                  image: qrCode,
                  height: size.height * 0.08,
                  width: size.width * 0.4,
                  onTap: () {},
                ),),

                Visibility(
                  visible: isDrawerOn,
                  child: _Drawer(),
                ),
              ],
            )));
  }

  Container _AppBarHomePage(double height, Size size, String account) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
          boxShadow: [kBoxShadow],
          gradient: LinearGradient(colors: gradientCuentaDNI),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radiusContainerLogin),
            bottomRight: Radius.circular(radiusContainerLogin),
          )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _WhiteLine(height: height, size: size),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        IconButton(
                            splashColor: Colors.grey,
                            splashRadius: 30,
                            icon: Image.asset(
                                'lib/assets/images/justification.png',
                                color: Colors.white),
                            onPressed: () {
                              setState(() {
                                isDrawerOn = true;
                              });
                              /*TODO drawer*/
                            }),
                      ],
                    ),
                  )),
              Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        logoCuentaDNI,
                        color: Colors.white,
                        height: size.height * 0.09,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(account,
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white)),
                          IconButton(
                              splashColor: Colors.grey,
                              splashRadius: 30,
                              icon: Image.asset(
                                'lib/assets/images/view.png',
                                color: Colors.white,
                                height: 28,
                              ),
                              onPressed: () {}),
                        ],
                      )
                    ],
                  )),
              Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          splashColor: Colors.grey,
                          splashRadius: 30,
                          icon: Image.asset(
                            'lib/assets/images/notification-bell.png',
                            color: Colors.white,
                            height: 50,
                          ),
                          onPressed: () {}),
                      FaIcon(FontAwesomeIcons.chevronRight,
                          size: 30, color: Colors.white),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class _SingleScrollView extends StatelessWidget {
  const _SingleScrollView({
    Key? key,
    required this.size,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SendRecieveBtn(size: size),
        _BtnTable(),
        _VendingBanner(size: size, pageController: pageController),
        SizedBox(height: size.height * 0.05),
        BtnRounded(
          width: size.width * 0.87,
          height: size.height * 0.1,
          onTap: () {},
        ),
        SizedBox(height: size.height * 0.05),
        OtherFunctionalities(
          width: size.width * 0.87,
          height: size.height * 0.25,
        ),
        SizedBox(height: size.height * 0.15),
      ],
    ));
  }
}

class _VendingBanner extends StatelessWidget {
  const _VendingBanner({
    Key? key,
    required this.size,
    required this.pageController,
  }) : super(key: key);

  final Size size;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      width: size.width * 0.87,
      height: size.height * 0.24,
      decoration: BoxDecoration(
        boxShadow: [kBoxShadow],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            physics: BouncingScrollPhysics(),
            controller: pageController,
            children: [
              _Page(
                image: imagePage1,
                size: size,
                text: '10% Descuento\nen restaurant',
              ),
              _Page(
                image: imagePage2,
                size: size,
                text: '15% Descuento\nen indumentaria',
              ),
              _Page(
                image: imagePage3,
                size: size,
                text: '5% Descuento\nen transporte',
              ),
            ],
          ),
          SmoothPageIndicator(
            effect: ScrollingDotsEffect(
              spacing: 10,
              fixedCenter: true,
              dotWidth: 11,
              dotHeight: 11,
              dotColor: Colors.grey,
              activeDotColor: Colors.black,
              activeDotScale: 1.55,
            ),
            controller: pageController,
            count: 3,
          ),
        ],
      ),
    );
  }
}

class _SendRecieveBtn extends StatelessWidget {
  const _SendRecieveBtn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [kBoxShadow],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(radiusContainerLogin),
              bottomLeft: Radius.circular(radiusContainerLogin))),
      width: double.infinity,
      height: size.height * appBarWhitePercent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: double.infinity,
            color: kTextColor,
            width: 1,
          ),
          Positioned(
              left: 10,
              bottom: 18,
              child: Container(
                padding: EdgeInsets.only(right: 15),
                width: size.width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/images/send-money.png',
                      height: size.height * 0.043,
                    ),
                    const Text(
                      'Enviar dinero',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                ),
              )),
          Positioned(
              right: 10,
              bottom: 18,
              child: Container(
                padding: EdgeInsets.only(left: 15),
                width: size.width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/images/money-withdrawal.png',
                      height: size.height * 0.043,
                    ),
                    Text(
                      'Enviar dinero',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _BtnTable extends StatelessWidget {
  const _BtnTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Table(
        children: [
          TableRow(children: [
            BtnSquareImage(
                image: 'lib/assets/images/barcode.png',
                text: 'Pagar con \nClave DNI',
                onTap: () {}),
            BtnSquareImage(
                image: 'lib/assets/images/currency-exchange.png',
                text: 'Transferir\n',
                onTap: () {}),
            BtnSquareImage(
                image: 'lib/assets/images/withdraw-money.png',
                text: 'Extraer sin\ntarjeta',
                onTap: () {}),
          ]),
          TableRow(children: [
            SizedBox(height: 30),
            SizedBox(height: 30),
            SizedBox(height: 30),
          ]),
          TableRow(
            children: [
              BtnSquareImage(
                  image: 'lib/assets/images/bill.png',
                  text: 'Pagar\nservicios',
                  onTap: () {}),
              BtnSquareImage(
                  image: 'lib/assets/images/mobile.png',
                  text: 'Recargar\ncelular',
                  onTap: () {}),
              BtnSquareImage(
                  image: 'lib/assets/images/bus.png',
                  text: 'Recargar\ntransporte',
                  onTap: () {}),
            ],
          )
        ],
      ),
    );
  }
}

class _WhiteLine extends StatelessWidget {
  const _WhiteLine({
    Key? key,
    required this.height,
    required this.size,
  }) : super(key: key);

  final double height;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: height * 0.57,
        child: Container(
          height: 2,
          width: size.width,
          color: Colors.white,
        ));
  }
}

class _Page extends StatelessWidget {
  const _Page(
      {Key? key, required this.image, required this.size, required this.text})
      : super(key: key);

  final String image;
  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(image,
              height: size.height * 0.12, fit: BoxFit.scaleDown),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: size.height * 0.022),
          )
        ],
      ),
    );
  }
}

class _Drawer extends StatefulWidget {
  const _Drawer({Key? key}) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<_Drawer> {
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
                Divider(thickness: 1),
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
