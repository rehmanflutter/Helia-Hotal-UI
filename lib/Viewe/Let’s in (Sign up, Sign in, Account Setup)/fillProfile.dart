import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../coustamWidget/Buttoncustam.dart';

import 'package:provider/provider.dart';

import '../../Controler/controler.dart';
import '../coustamWidget/textcustam.dart';
import '../coustamWidget/textfiledcustam.dart';

class FillYourProfile extends StatelessWidget {
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    final profileProviders =
        Provider.of<Forgetliststing>(context, listen: false);

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
                        icon: Icon(Icons.arrow_back)),
                    Textcustam(
                      text: 'profilef'.tr(),
                      weight: FontWeight.w600,
                      size: 24,
                    )
                  ],
                ),
                SizedBox(
                  height: media.height * 0.02,
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
                  height: media.height * 0.02,
                ),
                Textfiledcustam(
                  hinttext: 'Gender'.tr(),
                  controller: profileProviders.gender,
                  lasticon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_drop_down)),
                ),
                SizedBox(
                  height: media.height * 0.05,
                ),
                RoundButton(
                  title: 'continuebtn'.tr(),
                  fun: () async {
                    var pref = await SharedPreferences.getInstance();
                    pref.setBool("LOGIN", true);

                    Navigator.pushNamed(context, '/BottomBarCus');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void OptionPic(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final profileProvider =
            Provider.of<ProfileProvider>(context, listen: false);

        return AlertDialog(
          title: Text('Upload Profile Pic'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt_outlined),
                title: Text('Take A picture'),
                onTap: () {
                  profileProvider.getimage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.browse_gallery),
                title: Text('Select From Gallery'),
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
