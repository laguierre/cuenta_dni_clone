import 'dart:ui';

class SquareImageBtn {
  SquareImageBtn({required this.text, required this.image});

  final String text;
  final String image;

  static final List<SquareImageBtn> listSquareImageBtn = [
    SquareImageBtn(
        image: 'lib/assets/images/barcode.png', text: 'Pagar con \nClave DNI'),
    SquareImageBtn(
        image: 'lib/assets/images/currency-exchange.png', text: 'Transferir\n'),
    SquareImageBtn(
        image: 'lib/assets/images/withdraw-money.png',
        text: 'Extraer sin\ntarjeta'),
    SquareImageBtn(
        image: 'lib/assets/images/bill.png', text: 'Pagar\nservicios'),
    SquareImageBtn(
        image: 'lib/assets/images/mobile.png', text: 'Recargar\ncelular'),
    SquareImageBtn(
        image: 'lib/assets/images/bus.png', text: 'Recargar\ntransporte'),

    ///Other funtions///
    SquareImageBtn(image: 'lib/assets/images/afip.png', text: 'Pagos\nAFIP'),
    SquareImageBtn(
        image: 'lib/assets/images/credit-cards.png', text: 'Otras\ncargas'),
    SquareImageBtn(
        image: 'lib/assets/images/shop.png', text: 'Extraer en\ncomercios'),
    SquareImageBtn(
        image: 'lib/assets/images/information.png', text: 'Pagos\nAFIP'),
  ];
}

class BannerPage {
  BannerPage({required this.text, required this.image});

  final String text;
  final String image;
  late final Size size;

  static final List<BannerPage> listBannerPage = [
    BannerPage(
        image: 'lib/assets/images/undraw_breakfast_psiw.svg',
        text: '10% Descuento\nen restaurant'),
    BannerPage(
        image: 'lib/assets/images/undraw_online_shopping_re_k1sv.svg',
        text: '15% Descuento\nen indumentaria'),
    BannerPage(
        image: 'lib/assets/images/undraw_bus_stop_re_h8ej.svg',
        text: '5% Descuento\nen transporte'),
  ];
}

class LastDetailsMoves {
  LastDetailsMoves(
      {required this.date, required this.cost, required this.details});

  final String date;
  final String cost;
  final String details;

  static final List<LastDetailsMoves> listLastDetailsMoves = [
    LastDetailsMoves(
        date: '23/11', cost: '\$ -3.555,05', details: 'Compra pei cdni'),
    LastDetailsMoves(
        date: '22/11', cost: '\$ -903,25', details: 'Compra pei cdni'),
    LastDetailsMoves(
        date: '22/11', cost: '\$ -47,03', details: 'Compra pei cdni'),
    LastDetailsMoves(
        date: '22/11', cost: '\$ -3.555,05', details: 'Compra pei cdni'),
    LastDetailsMoves(
        date: '22/11', cost: '\$ -1.018,52', details: 'Compra pei cdni'),
  ];
}

class LabelCBU {
  LabelCBU({required this.label, required this.data});

  final String data;
  final String label;

  static final List<LabelCBU> listLabelCBU = [
    LabelCBU(label: 'Alias', data: 'PAPA.PIPO.POPO'),
    LabelCBU(label: 'CBU', data: '454546554753455674'),
    LabelCBU(label: 'CUIL', data: '2045584545'),
  ];
}

class SquareImageAndTextBtn {
  SquareImageAndTextBtn({required this.label, required this.image});

  final String label;
  final String image;

  static final List<SquareImageAndTextBtn> listSquareImageAndTextBtn = [
    SquareImageAndTextBtn(
        image: 'lib/assets/images/sharing.png',
        label: 'Solicitar a\notro usuario'),
    SquareImageAndTextBtn(
        image: 'lib/assets/images/bank.png', label: 'Sucursal\nBanco'),
    SquareImageAndTextBtn(
        image: 'lib/assets/images/transfer.png', label: 'Transferencia'),
  ];
}

class CustomDrawerClass {
  CustomDrawerClass({required this.label, required this.image});

  final String label;
  final String image;

  static final List<CustomDrawerClass> listCustomDrawer = [
    CustomDrawerClass(
        image: 'lib/assets/images/refresh.png', label: 'Cambiar contraseña'),
    CustomDrawerClass(
        image: 'lib/assets/images/contact.png', label: 'Contacto'),
    CustomDrawerClass(
        image: 'lib/assets/images/mobile2.png', label: 'Validar Telefono'),
    CustomDrawerClass(
        image: 'lib/assets/images/mail.png',
        label: 'Validar correo electrónico'),
    CustomDrawerClass(
        image: 'lib/assets/images/user.png', label: 'Alta usuario BIP'),
    CustomDrawerClass(
        image: 'lib/assets/images/agreement.png', label: 'Legales'),
    CustomDrawerClass(
        image: 'lib/assets/images/logout.png', label: 'Cerrar sesión'),
  ];
}
