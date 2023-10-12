import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lightversion/Viewe/coustamWidget/textcustam.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback fun;
  final Color? col;
  final Color? textcolor;
  RoundButton(
      {required this.title, required this.fun, this.col, this.textcolor});
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      height: media.height * 0.07,
      width: media.width,
      child: ElevatedButton(
        onPressed: fun,
        child: Textcustam(
          text: title,
          col: textcolor,
          weight: FontWeight.w700,
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: col,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
