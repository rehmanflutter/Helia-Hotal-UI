import 'package:flutter/material.dart';

class Bookingrooms {
  final String title;
  final String image;
  final String? suntile;
  Bookingrooms({required this.image, this.suntile, required this.title});
}

class Profiledetail {
  final String title;
  final IconData icon;
  //final Widget? widgeet;
  Profiledetail({required this.icon, required this.title});
}

class ListItem {
  final String label;
  bool isSelected;

  ListItem({required this.label, this.isSelected = false});
}
