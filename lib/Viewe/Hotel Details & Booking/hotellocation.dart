import 'package:flutter/material.dart';

import '../coustamWidget/textcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class HotelLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Textcustam(
                    text: 'location'.tr(),
                    size: 24,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    height: media.height * 0.850,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/map2.png'),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                      left: 10,
                      bottom: 10,
                      top: 10,
                      right: 10,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 50,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
