import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controler/hotalResevationcontrol.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';
import '../coustamWidget/textfiledcustam.dart';

class NewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final providercontrol =
        Provider.of<Nameresevertion>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    Textcustam(
                      text: 'New Card',
                      size: 24,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Container(
                  height: 240,
                  width: 380,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('images/card.png'),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: media.height * 0.03,
                ),
                Textfiledcustam(
                  hinttext: 'Full Name',
                  controller: providercontrol.cardname,
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Textfiledcustam(
                  hinttext: 'Card No',
                  controller: providercontrol.cardNo,
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: media.width * 0.4,
                      child: Textfiledcustam(
                          hinttext: '02/30', controller: providercontrol.dat),
                    ),
                    Container(
                      width: media.width * 0.4,
                      child: Textfiledcustam(
                        hinttext: 'price',
                        controller: providercontrol.price,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.height * 0.1,
                ),
                RoundButton(
                  title: 'Add New Card',
                  fun: () {
                    Navigator.pushNamed(context, '/NewPamentCard');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
