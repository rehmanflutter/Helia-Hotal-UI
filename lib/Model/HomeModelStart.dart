import 'package:flutter/material.dart';

class HomeListsec {
  final String image;
  final String titile;
  final int price;

  HomeListsec({required this.image, required this.titile, required this.price});
}

class HomethredList {
  final String images;
  final String title;
  final int price;
  final String rating;
  final double review;
  final String? country;
  HomethredList(
      {required this.images,
      required this.price,
      required this.rating,
      required this.review,
      required this.title,
      this.country});
}

class Notifictioned {
  final String image;
  final String title;
  final String subtitle;
  Notifictioned(
      {required this.image, required this.subtitle, required this.title});
}
