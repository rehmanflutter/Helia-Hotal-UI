import 'package:flutter/cupertino.dart';

import '../Model/SearchModel.dart';
import '../Viewe/coustamWidget/textcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class BookingProvider extends ChangeNotifier {
  List bottom3 = [
    'ongoing',
    'Completed',
    'Canceled',
  ];
  int _itemSelect3 = 1;
  int get itemSelect3 => _itemSelect3;

  void selectFunction(int index) {
    _itemSelect3 = index;
    notifyListeners();
  }

  List<Bookingrooms> bookingroomalread = [
    Bookingrooms(
        image: 'images/book1.png', suntile: 'cont1'.tr(), title: 'namc1'),
    Bookingrooms(
        image: 'images/book2.png', suntile: 'cont2'.tr(), title: 'namc2'),
    Bookingrooms(
        image: 'images/book3.png', suntile: 'cont3'.tr(), title: 'namc3'),
    Bookingrooms(
        image: 'images/book1.png', suntile: 'cont4'.tr(), title: 'namc4'),
  ];

  List<Bookingrooms> completroom = [
    Bookingrooms(
        image: 'images/c1.png', suntile: 'coun1'.tr(), title: 'bulgariresort'),
    Bookingrooms(
        image: 'images/c2.png', suntile: 'coun2'.tr(), title: 'hotalm'),
    Bookingrooms(
        image: 'images/book3.png', suntile: 'coun3'.tr(), title: 'hotalm1'),
    Bookingrooms(
        image: 'images/c2.png', suntile: 'coun4'.tr(), title: 'hotalm2'),
  ];

  List<Bookingrooms> Viewbooking = [
    Bookingrooms(image: 'images/v1.png', suntile: 'con1'.tr(), title: 'nam1'),
    Bookingrooms(image: 'images/v2.png', suntile: 'con2'.tr(), title: 'nam2'),
    Bookingrooms(image: 'images/v3.png', suntile: 'con3'.tr(), title: 'nam3'),
    Bookingrooms(image: 'images/v1.png', suntile: 'con4'.tr(), title: 'nam4'),
  ];

  List<Bookingrooms> pamentreturn = [
    Bookingrooms(image: 'images/paypal.png', title: 'paypal'.tr()),
    Bookingrooms(image: 'images/Google.png', title: 'googlepay'.tr()),
    Bookingrooms(image: 'images/apple.png', title: 'applpay'.tr()),
    Bookingrooms(image: 'images/no.png', title: '•••• ••••  •••• 4679'),
  ];
  int selectedRadioIndex = 0;

  List<String> selectOne = [
    'Paypal',
    'Google pay',
    'Apple Pay',
    'Apple Pay',
    'no',
  ];

  void setRadio(int index) {
    selectedRadioIndex = index;
    notifyListeners();
  }
}
