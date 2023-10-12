import 'dart:async';

import 'package:flutter/material.dart';

import 'coustamWidget/textcustam.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LightWelcomV1 extends StatefulWidget {
  const LightWelcomV1({super.key});

  @override
  State<LightWelcomV1> createState() => _LightWelcomV1State();
}

class _LightWelcomV1State extends State<LightWelcomV1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushNamed(context, '/LightCarousel');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/imagebacground.png'),
                fit: BoxFit.fill)),
        child: Padding(
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
                // text: AppLocalizations.of(context)!.welcom,
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
      ),
    );
  }
}
