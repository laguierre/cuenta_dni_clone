import 'package:cuenta_dni_clone/src/pages/home_page/custom_drawer.dart';
import 'package:cuenta_dni_clone/src/pages/home_page/other_fuctionalities_widget.dart';
import 'package:cuenta_dni_clone/src/pages/myaccount/myaccount.dart';
import 'package:cuenta_dni_clone/src/utils/constants.dart';
import 'package:cuenta_dni_clone/src/utils/gradients.dart';
import 'package:cuenta_dni_clone/src/widgets/btn_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

bool isDrawerOn = false;
bool isLastMoves = false;
bool isShowMoney = true;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller.stop();
    _animation = Tween<double>(begin: 0, end: 280).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
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
    final PageController _pageController = PageController(initialPage: 0);
    double height = MediaQuery.of(context).size.height * appBarGreenPercent;
    String account = '\$ 1000,00';

    return SafeArea(
        child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: Stack(
              //alignment: Alignment.topCenter,
              children: [
                SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SendRecieveBtn(size: size),
                        _BtnTable(),
                        _VendingBanner(
                            size: size, pageController: _pageController),
                        SizedBox(height: size.height * 0.05),
                        _LastMoves(size),
                        SizedBox(height: size.height * 0.05),
                        OtherFunctionalities(
                            width: size.width * 0.87,
                            height: size.height * 0.25),
                        SizedBox(height: size.height * 0.15),
                      ],
                    )),
                _AppBarHomePage(height, size, account),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: FAB(
                    label: 'Pagar QR',
                    image: qrCode,
                    height: size.height * 0.08,
                    width: size.width * 0.4,
                    onTap: () {},
                  ),
                ),
                Visibility(
                  visible: isDrawerOn,
                  child: CustomDrawer(),
                ),
              ],
            )));
  }

  Material _LastMoves(Size size) {
    double space = size.height * 0.015;
    return Material(
        borderRadius: BorderRadius.circular(radiusRoundedBtn),
        //clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
            borderRadius: BorderRadius.circular(radiusRoundedBtn),
            highlightColor: Colors.red.withOpacity(0.5),
            splashColor: Colors.red.withOpacity(0.5),
            onTap: () {
              setState(() {
                if (!isLastMoves) {
                  _controller.forward();
                  isLastMoves = true;
                } else {
                  _controller.reverse();
                  isLastMoves = false;
                }
              });
            },
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 28),
              width: size.width * 0.87,
              height: size.height * 0.1 + _animation.value,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [kBoxShadow],
                borderRadius: BorderRadius.circular(radiusRoundedBtn),
              ),
              child: Column(children: [
                Row(
                  children: [
                    FaIcon(!isLastMoves
                        ? FontAwesomeIcons.chevronDown
                        : FontAwesomeIcons.chevronUp),
                    SizedBox(width: size.width * 0.05),
                    Text(
                      'Últimos movimientos',
                      style: TextStyle(fontSize: size.height * 0.025),
                    ),
                  ],
                ),
                Visibility(
                    visible: isLastMoves,
                    child: Expanded(
                        child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.01),
                            const Divider(thickness: 2),
                            SizedBox(height: space),
                            _LastDetailsMoves(
                                date: '23/11',
                                cost: '\$ -3.555,05',
                                details: 'Compra pei cdni'),
                            SizedBox(height: space),
                            _LastDetailsMoves(
                                date: '22/11',
                                cost: '\$ -903,25',
                                details: 'Compra pei cdni'),
                            SizedBox(height: space),
                            _LastDetailsMoves(
                                date: '22/11',
                                cost: '\$ -1.215,45',
                                details: 'Compra pei cdni'),
                            SizedBox(height: space),
                            _LastDetailsMoves(
                                date: '22/11',
                                cost: '\$ -47,03',
                                details: 'Compra pei cdni'),
                            SizedBox(height: space),
                            _LastDetailsMoves(
                                date: '22/11',
                                cost: '\$ -1.018,52',
                                details: 'Compra pei cdni'),
                          ]),
                    ))),
              ]),
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
                          isShowMoney
                              ? Text(account,
                                  style: TextStyle(
                                      fontSize: size.width * 0.1,
                                      color: Colors.white))
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
                      IconButton(

                        icon: const FaIcon(FontAwesomeIcons.chevronRight,
                            size: 30, color: Colors.white),
                        onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyAccountPage()),
                        );},
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class _LastDetailsMoves extends StatelessWidget {
  const _LastDetailsMoves({
    Key? key,
    required this.date,
    required this.details,
    required this.cost,
  }) : super(key: key);

  final String date, details, cost;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            Text(details, style: TextStyle(fontSize: 20)),
          ],
        ),
        Spacer(),
        Text(cost, style: TextStyle(fontSize: 20)),
      ],
    );
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
      padding: EdgeInsets.only(bottom: size.height * 0.015),
      alignment: Alignment.center,
      width: size.width * 0.87,
      height: size.height * 0.24,
      decoration: BoxDecoration(
        boxShadow: [kBoxShadow],
        color: Colors.white,
        borderRadius: BorderRadius.circular(radiusRoundedBtn),
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
          const TableRow(children: [
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
