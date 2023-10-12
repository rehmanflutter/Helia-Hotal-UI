import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splish2 extends StatefulWidget {
  @override
  State<Splish2> createState() => _Splish2State();
}

class _Splish2State extends State<Splish2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushNamed(context, '/SplishWelcom2');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          Image.asset(
            'images/Vector.png',
            color: Colors.white,
          ),
          SpinKitCircle(
            color: Colors.white,
            size: 60.0,
          )
        ],
      ),
    );
  }
}
