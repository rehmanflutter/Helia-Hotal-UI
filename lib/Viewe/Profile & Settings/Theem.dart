import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Controler/bookingcontrol.dart';
import '../../Controler/profilesettingcontrol.dart';
import '../coustamWidget/textcustam.dart';

class ThemDark extends StatelessWidget {
  const ThemDark({super.key});

  @override
  Widget build(BuildContext context) {
    final Themchanger = Provider.of<Profilesettinglist>(context);

    final providercontrol =
        Provider.of<Profilesettinglist>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    text: 'changeapptheme'.tr(),
                    size: 24,
                    weight: FontWeight.w700,
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              RadioListTile<ThemeMode>(
                title: Text('lightmood'.tr()),
                value: ThemeMode.light,
                groupValue: Themchanger.themeMode,
                onChanged: (value) async {
                  var per = await SharedPreferences.getInstance();
                  per.setBool("theme", false);
                  Themchangecolor.lightmoods = true;

                  Themchanger.setThem(ThemeMode.light);
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text('dark'.tr()),
                value: ThemeMode.dark,
                groupValue: Themchanger.themeMode,
                onChanged: (value) async {
                  var per = await SharedPreferences.getInstance();
                  per.setBool("theme", true);
                  Themchanger.setThem(ThemeMode.dark);
                  Themchangecolor.lightmoods = false;
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text('systemmood'.tr()),
                value: ThemeMode.system,
                groupValue: Themchanger.themeMode,
                onChanged: (value) async {
                  var per = await SharedPreferences.getInstance();
                  per.setBool("theme", false);
                  Themchangecolor.lightmoods = true;

                  Themchanger.setThem(ThemeMode.system);
                },
              ),
              Divider(
                height: 30,
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                  onLongPress: () {
                    FlutterClipboard.copy(
                        'https://youtube.com/@ibrahimvlog7861?feature=shared');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Link copied to clipboard'),
                    ));
                  },
                  onPressed: () {
                    launchUrl(
                      Uri.parse(
                          'https://youtube.com/@ibrahimvlog7861?feature=shared'),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Text(
                      'https://youtube.com/@ibrahimvlog7861?feature=shared'))
            ],
          ),
        ),
      ),
    );
  }

  //   void copyToClipboard(String text) {
  // FlutterClipboard.copy('https://youtube.com/@ibrahimvlog7861?feature=shared')
  //       .then((value) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text('Link copied to clipboard'),
  //     ));
  //   });
  // }
}
