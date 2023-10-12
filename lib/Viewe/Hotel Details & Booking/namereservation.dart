import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controler/controler.dart';
import '../../Controler/hotalResevationcontrol.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';
import '../coustamWidget/textfiledcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class NameofReservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProviders =
        Provider.of<Forgetliststing>(context, listen: false);

    final controler = Provider.of<Nameresevertion>(context, listen: false);
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      text: 'resever'.tr(),
                      size: 24,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Center(
                  child: Container(
                    height: media.height * 0.05,
                    child: Consumer<Nameresevertion>(
                      builder: (context, value, child) => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          bool select = index == controler.itemSelect3;

                          return InkWell(
                            onTap: () {
                              controler.selectFunction(index);
                            },
                            child: Container(
                              width: media.width * 0.2,
                              margin: EdgeInsets.only(right: 10, left: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: select ? Colors.green : null,
                                border:
                                    Border.all(width: 2.0, color: Colors.green),
                              ),
                              child: Center(
                                child: Textcustam(
                                  text: '   ${controler.bottom3[index]} ',
                                  col: select ? Colors.white : Colors.green,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: controler.bottom3.length,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.03,
                ),
                Textfiledcustam(
                  hinttext: 'fulname'.tr(),
                  controller: profileProviders.nametext,
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Textfiledcustam(
                  hinttext: 'nickname'.tr(),
                  controller: profileProviders.nicname,
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Textfiledcustam(
                    hinttext: 'birth'.tr(),
                    controller: profileProviders.dateof,
                    lasticon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.date_range_rounded),
                    )),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Textfiledcustam(
                    hinttext: 'Email'.tr(),
                    controller: profileProviders.email,
                    lasticon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.email),
                    )),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Textfiledcustam(
                  hinttext: 'Phonenumber'.tr(),
                  controller: profileProviders.phoneno,
                ),
                SizedBox(
                  height: media.height * 0.140,
                ),
                RoundButton(
                  title: 'continuebtn'.tr(),
                  fun: () {
                    Navigator.pushNamed(context, '/PaymentPaychose');
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
