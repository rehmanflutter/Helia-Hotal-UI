import 'package:flutter/cupertino.dart';

import '../Model/HomeModelStart.dart';
import 'package:easy_localization/easy_localization.dart';

//

//HomePage Provider   bottom AppBar first all page provider

//

class Homecontrol extends ChangeNotifier {
  List<String> selectrlist = [
    'recommended',
    'popular',
    'trending',
    'folower',
    'live',
  ];

  int _itemselect = 0;
  int get itemselect => _itemselect;
  void funslect(int index) {
    _itemselect = index;
    notifyListeners();
  }
//  Home Page 2nd List

  List<HomeListsec> listTwo = [
    HomeListsec(image: 'images/room1.png', titile: 'hotal', price: 29),
    HomeListsec(image: 'images/room2.png', titile: 'hotal1', price: 32),
    HomeListsec(image: 'images/room3.png', titile: 'hotal2', price: 35)
  ];

//  Home Page 3rd List

  List<HomethredList> listthree = [
    HomethredList(
        images: 'images/rom1.png',
        price: 35,
        rating: '4.8',
        review: 4378,
        title: 'hotal3'),
    HomethredList(
        images: 'images/rom2.png',
        price: 29,
        rating: '4.7',
        review: 5277,
        title: 'hotal4'),
    HomethredList(
        images: 'images/rom3.png',
        price: 36,
        rating: '4.9',
        review: 3277,
        title: 'hotal5'),
    HomethredList(
        images: 'images/rom4.png',
        price: 27,
        rating: '4.8',
        review: 4889,
        title: 'hotal6'),
    HomethredList(
        images: 'images/rom5.png',
        price: 32,
        rating: '4.6',
        review: 3672,
        title: 'hotal7'),
    HomethredList(
        images: 'images/rom6.png',
        price: 35,
        rating: '4.8',
        review: 4378,
        title: 'hotal8'),
    HomethredList(
        images: 'images/rom7.png',
        price: 39,
        rating: '5.0',
        review: 6788,
        title: 'hotal9'),
  ];

// like list add  Provider

  List _like = [];
  List get like => _like;

  void likevedio(int value) {
    _like.add(value);
    notifyListeners();
  }

  void dislikevedio(int value) {
    _like.remove(value);
    notifyListeners();
  }
}

//

//  Homepage    Notifictioned list  Provider

//

class Towdaylist extends ChangeNotifier {
  List<Notifictioned> firstlist = [
    Notifictioned(
        image: 'images/list1noti.png',
        subtitle: 'notification1',
        title: 'text1'),
    Notifictioned(
        image: 'images/listNoti1.png',
        subtitle: 'notification2',
        title: 'text2')
  ];

  List<Notifictioned> sectlist = [
    Notifictioned(
        image: 'images/selist2.png',
        title: 'notification3',
        subtitle: 'text3'.tr()),
    Notifictioned(
        image: 'images/selist22.png',
        title: 'notification4',
        subtitle: 'text4'.tr())
  ];
  List<Notifictioned> thredlist = [
    Notifictioned(
        image: 'images/list1noti.png',
        subtitle: 'notification5',
        title: 'text5'),
    Notifictioned(
        image: 'images/listNoti1.png',
        subtitle: 'notification6',
        title: 'text6')
  ];
}
