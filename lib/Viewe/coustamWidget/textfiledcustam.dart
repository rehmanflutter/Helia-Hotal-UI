import 'package:flutter/material.dart';

import '../../Controler/profilesettingcontrol.dart';

class Textfiledcustam extends StatelessWidget {
  final String? hinttext;
  final String? labeltext;
  final Icon? starticon;
  final IconButton? lasticon;
  final bool? obscur;
  final VoidCallback? fun;

  final TextInputType? keyboardType;
  final TextEditingController? controller;

  Textfiledcustam(
      {this.hinttext,
      this.controller,
      this.labeltext,
      this.lasticon,
      this.obscur = false,
      this.starticon,
      this.keyboardType,
      this.fun});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      height: media.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Themchangecolor.lightmoods == true
            ? Colors.grey.shade100
            : Colors.black,
      ),
      child: TextFormField(
        obscureText: obscur!,
        keyboardType: keyboardType,
        style: TextStyle(),
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
          labelText: labeltext,
          prefixIcon: starticon,
          suffixIcon: lasticon,
          border: InputBorder.none,
          prefixText: '   ',
        ),
        onChanged: (value) {
          fun;
        },
      ),
    );
  }
}
