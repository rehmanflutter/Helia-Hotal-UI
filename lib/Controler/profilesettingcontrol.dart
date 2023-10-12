import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/SearchModel.dart';

// Profiles  Providers

class Profilesettinglist extends ChangeNotifier {
  List<Profiledetail> listselect = [
    Profiledetail(icon: Icons.person, title: 'edprofile'),
    Profiledetail(icon: Icons.payment, title: 'payment'),
    Profiledetail(icon: Icons.notifications, title: 'notification'),
    Profiledetail(icon: Icons.security, title: 'security'),
    Profiledetail(icon: Icons.help_center_outlined, title: 'help'),
    Profiledetail(icon: Icons.remove_red_eye, title: 'darkmood'),
  ];

  List<String> notificationlist = [
    'generalnoti',
    'sound',
    'vibrate',
    'appupdates',
    'serviceavailable',
    'newtips'
  ];
  List<bool> notificationList = [
    false,
    true,
    false,
    true,
    false,
    true,
  ]; // Replace this with your list of boolean values
  bool _switchValue = false;

  bool get switchValue => _switchValue;

  void switchFun(bool value, int index) {
    notificationList[index] = value;
    _switchValue = value;
    notifyListeners();
  }

  List<String> Securitylist = ['faceid', 'rememberme', 'touchid'];
  List<bool> Securitylistoptuin = [
    false,
    true,
    false,
  ]; // Replace this with your list of boolean values
  bool _switchValueSecurity = false;

  bool get switchValueSecurity => _switchValueSecurity;

  void switchFunSecurity(bool value, int index) {
    Securitylistoptuin[index] = value;
    _switchValueSecurity = value;
    notifyListeners();
  }

//  Light and Dark Mood  Radio Buttons

  int selectedRadioIndex = 0;

  void setRadio(int index) {
    selectedRadioIndex = index;
    notifyListeners();
  }

  var _Themechange = ThemeMode.light;
  ThemeMode get themeMode => _Themechange;

  void setThem(ThemeMode) {
    _Themechange = ThemeMode;
    notifyListeners();
  }
}

class Themchangecolor {
  static bool lightmoods = true;
}
