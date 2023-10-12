import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LightSplishV1 extends StatefulWidget {
  @override
  State<LightSplishV1> createState() => _LightSplishV1State();
}

class _LightSplishV1State extends State<LightSplishV1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        movescreens();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          Image.asset(
            'images/Vector.png',
          ),
          SpinKitCircle(
            color: Colors.green,
            size: 60.0,
          )
        ],
      ),
    );
  }

  void movescreens() async {
    var sharpref = await SharedPreferences.getInstance();
    var islogin = sharpref.getBool("LOGIN");
    if (islogin != null) {
      if (islogin) {
        Navigator.pushReplacementNamed(context, '/BottomBarCus');
      } else {
        Navigator.pushReplacementNamed(context, '/LightWelcomV1');
      }
    } else {
      Navigator.pushReplacementNamed(context, '/LightWelcomV1');
    }
  }
}
