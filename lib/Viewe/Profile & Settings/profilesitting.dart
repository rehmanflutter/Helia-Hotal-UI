import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controler/controler.dart';
import '../../Controler/profilesettingcontrol.dart';
import '../Let’s in (Sign up, Sign in, Account Setup)/Lestyouin.dart';
import '../My Hotel Booking/payment.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';
import 'Theem.dart';
import 'help.dart';
import 'notificationse.dart';
import 'profileset.dart';
import 'security.dart';

enum Language { english, Urdu }

class ProfileSettings extends StatelessWidget {
  List classes = [
    ProfilesetSetting(),
    CancelHotelBookingpayment(),
    NotificationSetting(),
    Security(),
    Help(),
    ThemDark(),
    Container()
  ];
  @override
  Widget build(BuildContext context) {
    final editprofile = Provider.of<Profilesettinglist>(context, listen: false);
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('images/homepic.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Textcustam(
                          text: 'profile'.tr(),
                          weight: FontWeight.w700,
                          size: 24,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        PopupMenuButton<Locale>(
                          onSelected: (Locale locale) async {
                            var pref = await SharedPreferences.getInstance();
                            // Store the selected language preference in shared preferences
                            if (locale.languageCode == 'en') {
                              await pref.setString('language', 'en');
                            } else if (locale.languageCode == 'ur') {
                              await pref.setString('language', 'ur');
                            }
                            context.setLocale(
                                locale); // Change the app's locale when a language is selected
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                value: Locale('en'),
                                child: Text('English'),
                              ),
                              PopupMenuItem(
                                value: Locale('ur'),
                                child: Text('Urdu'),
                              ),
                            ];
                          },
                          child: Icon(Icons.language),
                        ),
                      ],
                    )
                  ],
                ),
                Consumer<ProfileProvider>(
                  builder: (context, profileProvider, child) {
                    return Stack(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                        ),
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: profileProvider.imagess != null
                              ? FileImage(profileProvider.imagess!)
                              : null,
                          child: profileProvider.imagess != null
                              ? null
                              : Icon(
                                  Icons.person,
                                  size: 60,
                                ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: IconButton(
                            onPressed: () {
                              OptionPic(context);
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: media.height * 0.01,
                ),
                Textcustam(
                  text: 'name'.tr(),
                  //text: '',
                  size: 24,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: media.height * 0.01,
                ),
                Textcustam(
                  text: 'daniel_austin@yourdomain.com',
                  size: 14,
                  weight: FontWeight.w600,
                ),
                Divider(
                    // height: 20,
                    ),
                Container(
                  height: media.height * 0.450,
                  // color: Colors.red,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => classes[index]));
                          },
                          leading: Icon(editprofile.listselect[index].icon),
                          title: Textcustam(
                              text: '${editprofile.listselect[index].title}'
                                  .tr()));
                    },
                    itemCount: editprofile.listselect.length,
                  ),
                ),
                ListTile(
                  onTap: () {
                    showlogout(context);
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: Textcustam(
                    text: 'logout'.tr(),
                    col: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showlogout(BuildContext context) async {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Textcustam(
                text: 'logout'.tr(),
                col: Colors.red,
                size: 24,
                weight: FontWeight.w700,
              ),
              Divider(
                height: 30,
              ),
              Textcustam(
                text: 'surelogout'.tr(),
                size: 20,
                weight: FontWeight.w700,
              ),
              SizedBox(
                height: 30,
              ),
              RoundButton(
                title: 'yeslogout'.tr(),
                fun: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool("LOGIN", false);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LestYouIn(),
                      ));
                  // pref.setString('language', 'en');
                  // context.setLocale(
                  //     Locale('en')); // Change app's locale to English

                  //   Navigator.pushNamed(context, '/LestYouIn');
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                title: 'cancels'.tr(),
                textcolor: Colors.green,
                col: Colors.blue.shade50,
                fun: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }

// chose to take pic
  void OptionPic(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final profileProvider =
            Provider.of<ProfileProvider>(context, listen: false);

        return AlertDialog(
          title: Text('picprofile'.tr()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt_outlined),
                title: Text('takepic'.tr()),
                onTap: () {
                  profileProvider.getimage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.browse_gallery),
                title: Text('gallery'.tr()),
                onTap: () {
                  profileProvider.getimage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
