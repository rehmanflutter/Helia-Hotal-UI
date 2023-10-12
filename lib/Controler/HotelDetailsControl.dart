import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';

import '../Model/detailhotalModel.dart';

//  Hotel Details & Booking Folader  Providers

class GalleryViewPhotos extends ChangeNotifier {
  //Gallery View Images list

  List<String> viewimages = [
    'images/GalleryPhotos1.png',
    'images/GalleryPhotos12.png',
    'images/GalleryPhotos3.png',
    'images/GalleryPhotos4.png',
    'images/GalleryPhotos5.png',
    'images/GalleryPhotos6.png',
    'images/GalleryPhotos7.png',
    'images/GalleryPhotos8.png',
    'images/GalleryPhotos9.png',
    'images/GalleryPhotos10.png',
    'images/GalleryPhotos11.png',
  ];

//   Details Hotal

  List<DetailModel> detailss = [
    DetailModel(image: 'images/icons1.png', name: 'hotels'),
    DetailModel(image: 'images/icons2.png', name: 'bedrooms'),
    DetailModel(image: 'images/icons3.png', name: 'bathrooms'),
    DetailModel(image: 'images/icons4.png', name: 'sqft'),
  ];

  //FacilitesHotal

  List<DetailModel> FacilitesHotal = [
    DetailModel(image: 'images/Facilites1.png', name: 'swimmingpool'),
    DetailModel(image: 'images/Facilites2.png', name: 'WiFi'),
    DetailModel(image: 'images/Facilites3.png', name: 'restaurant'),
    DetailModel(image: 'images/Facilites4.png', name: 'parking'),
    DetailModel(image: 'images/Facilites5.png', name: 'meeting'),
    DetailModel(image: 'images/Facilites6.png', name: 'elevator'),
    DetailModel(image: 'images/Facilites7.png', name: 'fitness'),
    DetailModel(image: 'images/Facilites8.png', name: 'open'),
  ];

//  reviews Hotal list

  List<ReviewHotel> reviews = [
    ReviewHotel(
        image: 'images/re1.png',
        name: 'namer1'.tr(),
        dec: 'rivie1'.tr(),
        ratings: 5),
    ReviewHotel(
        image: 'images/re3.png',
        name: 'namer2'.tr(),
        dec: 'rivie2'.tr(),
        ratings: 4),
    ReviewHotel(
        image: 'images/re2.png',
        name: 'namer3'.tr(),
        dec: 'rivie3'.tr(),
        ratings: 5),
    ReviewHotel(
        image: 'images/re4.png',
        name: 'namer4'.tr(),
        dec: 'rivie4'.tr(),
        ratings: 3)
  ];

//  reviews Hotal list  check
  List bottom3 = ['All', '5', '4', '3', '2', '1'];
  int _itemselect3 = 0;
  int get itemselect3 => _itemselect3;
  void funslect3(int index) {
    _itemselect3 = index;
    notifyListeners();
  }
}
