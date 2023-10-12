import 'package:flutter/cupertino.dart';

import '../Model/SearchModel.dart';
import 'package:easy_localization/easy_localization.dart';

// Book Now Ticket   Provider  Name OF Resevertion

class Nameresevertion extends ChangeNotifier {
  List bottom3 = [
    '  Mr.  ',
    '  Mrs. ',
    '  Ms.  ',
  ];
  int _itemSelect3 = 1;
  int get itemSelect3 => _itemSelect3;

  void selectFunction(int index) {
    _itemSelect3 = index;
    notifyListeners();
  }

  //  Pay Payment Ticket

  List<Bookingrooms> pamentreturn = [
    Bookingrooms(image: 'images/paypal.png', title: 'paypal'.tr()),
    Bookingrooms(image: 'images/Google.png', title: 'googlepay'.tr()),
    Bookingrooms(image: 'images/apple.png', title: 'applpay'.tr()),
    Bookingrooms(image: 'images/no.png', title: '•••• ••••  •••• 4679'),
  ];
  int selectedRadioIndex = 0;

  int selectIndex = 0;

  List<String> selectOne = [
    'Paypal',
    'Google pay',
    'Apple Pay',
    'no',
  ];

  void setRadio(int index) {
    selectedRadioIndex = index;
    notifyListeners();
  }

//  Name OF Resevertion  Textfiled

  TextEditingController cardname = TextEditingController();
  TextEditingController cardNo = TextEditingController();

  TextEditingController dat = TextEditingController();

  TextEditingController price = TextEditingController();
}
