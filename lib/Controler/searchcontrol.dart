import 'package:flutter/cupertino.dart';

import '../Model/HomeModelStart.dart';
import '../Model/SearchModel.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchProvider extends ChangeNotifier {
  List firstlist1 = [
    'list1',
    'list2',
    'list3',
    'list4',
    'list5',
    'list6',
  ];
  int _itemselect = 0;
  int get itemselect => _itemselect;
  void funslect(int index) {
    _itemselect = index;
    notifyListeners();
  }

  final searchcontrol = TextEditingController();

  int SelestListtoIndex = 0;
// listwo lis add index

  List<HomethredList> listwo = [
    HomethredList(
        images: 'images/rom5.png',
        price: 27,
        rating: '4.8',
        country: 'contry'.tr(),
        review: 4378,
        title: 'name1'.tr()),
    HomethredList(
        images: 'images/rom4.png',
        price: 35,
        rating: '4.7',
        country: 'contry2'.tr(),
        review: 5277,
        title: 'name2'.tr()),
    HomethredList(
        images: 'images/rom3.png',
        price: 32,
        rating: '4.9',
        country: 'contry3'.tr(),
        review: 3277,
        title: 'name3'.tr()),
    HomethredList(
        images: 'images/rom2.png',
        country: 'contry4'.tr(),
        price: 36,
        rating: '4.8',
        review: 4889,
        title: 'name4'.tr()),
    HomethredList(
        images: 'images/rom1.png',
        price: 32,
        rating: '4.6',
        country: 'contry5'.tr(),
        review: 3672,
        title: 'name5'.tr()),
    HomethredList(
        images: 'images/rom6.png',
        price: 35,
        rating: '4.8',
        country: 'contry6'.tr(),
        review: 4378,
        title: 'name6'.tr()),
    HomethredList(
        images: 'images/rom7.png',
        price: 39,
        rating: '5.0',
        country: 'contry7'.tr(),
        review: 6788,
        title: 'name7'.tr()),
    HomethredList(
        images: 'images/hotal1.png',
        country: 'contry8'.tr(),
        price: 29,
        rating: '4.8',
        review: 4981,
        title: 'name8'.tr()),
    HomethredList(
        images: 'images/hotal2.png',
        price: 33,
        rating: '4.6',
        country: 'contry9'.tr(),
        review: 4372,
        title: 'name9'.tr()),
    HomethredList(
        images: 'images/hotal3.png',
        price: 31,
        rating: '4.6',
        country: 'contry10'.tr(),
        review: 3672,
        title: 'name10'.tr()),
    HomethredList(
        images: 'images/hotal4.png',
        price: 34,
        rating: '5.0',
        country: 'counte'.tr(),
        review: 6788,
        title: 'name11'.tr()),
  ];
//

// search list name to open

//
  String search = '';
  TextEditingController searchController = TextEditingController();
  void setSearch(String value) {
    search = value.toLowerCase();
    notifyListeners();
  }

  //   Recommended like
  List _likes = [];
  List get likes => _likes;

  void likevedios(int value) {
    _likes.add(value);
    notifyListeners();
  }

  void dislikevedios(int value) {
    _likes.remove(value);
    notifyListeners();
  }
}
//

//  BottomsheetinSearch Controlers

//

class BottomsheetinSearch extends ChangeNotifier {
  List bottom1 = [
    '  France  ',
    '  Italia  ',
    '  Turkiye  ',
    '  Germany  ',
    '  Pakistan  ',
    '  usa  ',
  ];
  int _itemselect1 = 0;
  int get itemselect1 => _itemselect1;
  void funslect1(int index) {
    _itemselect1 = index;
    notifyListeners();
  }

  List bottom2 = [
    '  Highest Popularity  ',
    '  Highest Price  ',
    '  Lowest Price  ',
    '  Lowest Popularity  ',
  ];
  int _itemselect2 = 0;
  int get itemselect2 => _itemselect2;
  void funslect2(int index) {
    _itemselect2 = index;
    notifyListeners();
  }

  List bottom3 = [1, 2, 3, 4, 5];
  int _itemselect3 = 0;
  int get itemselect3 => _itemselect3;
  void funslect3(int index) {
    _itemselect3 = index;
    notifyListeners();
  }

//

//  Facilities  check Box

//
  bool _checkBoxNotifier = false;

  bool get checkBoxValues => _checkBoxNotifier;

  void boxvalue(bool newValue) {
    _checkBoxNotifier = newValue;
    notifyListeners();
  }

  bool _allSelected = false;

  List<ListItem> items = [
    ListItem(label: 'WiFi'),
    ListItem(label: 'Swimming Pool '),
    ListItem(label: 'Parking '),
    ListItem(label: 'Restaurant '),
    // Add more items as needed
  ];

  void toggleAllItemsSelection() {
    for (var item in items) {
      item.isSelected = _allSelected;
    }
    _allSelected = !_allSelected;
    notifyListeners();
  }

  void toggleItemSelection(int index) {
    items[index].isSelected = !items[index].isSelected;
    notifyListeners();
  }

  bool _checkBoxNotifierAccommodation = false;

  bool get checkBoxValuesAccommodation => _checkBoxNotifierAccommodation;

  void boxvalueAccommodation(bool newValue) {
    _checkBoxNotifierAccommodation = newValue;
    notifyListeners();
  }

//

// Accommodation Type  check Box

//

  bool _allSelectedAccommodation = false;

  List<ListItem> itemsAccommodation = [
    ListItem(label: 'Hotels'),
    ListItem(label: 'Resorts  '),
    ListItem(label: 'Villas '),
    ListItem(label: 'Apartments '),
    ListItem(label: 'Resorts  '),
    // Add more items as needed
  ];

  void toggleAllItemsSelectionAccommodation() {
    for (var item in itemsAccommodation) {
      item.isSelected = _allSelectedAccommodation;
    }
    _allSelectedAccommodation = !_allSelectedAccommodation;
    notifyListeners();
  }

  void toggleItemSelectionAccommodation(int index) {
    itemsAccommodation[index].isSelected =
        !itemsAccommodation[index].isSelected;
    notifyListeners();
  }
}
