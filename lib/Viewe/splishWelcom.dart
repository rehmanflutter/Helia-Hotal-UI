import 'dart:async';

import 'package:flutter/material.dart';

import 'coustamWidget/textcustam.dart';

class SplishWelcom2 extends StatefulWidget {
  @override
  State<SplishWelcom2> createState() => _SplishWelcom2State();
}

class _SplishWelcom2State extends State<SplishWelcom2> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushNamed(context, '/Consol2Light');
      },
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bacground2splish.png'),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Positioned(bottom: 0, child: Image.asset('images/Rectangle.png')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: media.height * 0.03,
                  ),
                  Textcustam(
                    text: 'Welcome to 👋',
                    size: 40,
                    weight: FontWeight.w700,
                    col: Colors.white,
                  ),
                  SizedBox(
                    height: media.height * 0.02,
                  ),
                  Textcustam(
                    text: 'Helia',
                    weight: FontWeight.w900,
                    size: 96,
                    col: Colors.green,
                  ),
                  SizedBox(
                    height: media.height * 0.02,
                  ),
                  Textcustam(
                    text:
                        'The best hotel booking in this century to accompany your vacation',
                    col: Colors.white,
                  ),
                  SizedBox(
                    height: media.height * 0.02,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
