import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controler/controler.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';
import '../coustamWidget/textfiledcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfilesetSetting extends StatelessWidget {
  const ProfilesetSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProviders =
        Provider.of<Forgetliststing>(context, listen: false);

    final media = MediaQuery.of(context).size;
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
                        icon: Icon(Icons.arrow_back)),
                    Textcustam(
                      text: 'edprofile'.tr(),
                      size: 24,
                      weight: FontWeight.w700,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
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
                  height: media.height * 0.02,
                ),
                Textfiledcustam(
                  hinttext: 'Gender'.tr(),
                  controller: profileProviders.gender,
                  lasticon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_drop_down)),
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                RoundButton(
                  title: 'updat'.tr(),
                  fun: () {
                    Navigator.pop(context);
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
