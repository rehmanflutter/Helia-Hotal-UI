import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controler/controler.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';
import '../coustamWidget/textfiledcustam.dart';

class CreateNewPassword extends StatelessWidget {
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  ValueNotifier<bool> toggles = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final providecontrol =
        Provider.of<CreateYourNewPasswordss>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: media.height * 0.048,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Textcustam(
                    text: '  Create New Password',
                    weight: FontWeight.w600,
                    size: 24,
                  )
                ],
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              Container(
                height: 240,
                width: 240,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/dan.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: media.height * 0.03,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Textcustam(text: 'Create Your New Password')),
              SizedBox(
                height: media.height * 0.02,
              ),
              ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context, value, child) => Textfiledcustam(
                  hinttext: 'Password',
                  starticon: Icon(Icons.lock),
                  lasticon: IconButton(
                      onPressed: () {
                        toggle.value = !toggle.value;
                      },
                      icon: Icon(toggle.value
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  obscur: toggle.value,
                ),
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              ValueListenableBuilder(
                valueListenable: toggles,
                builder: (context, value, child) => Textfiledcustam(
                  hinttext: 'confirm Password',
                  starticon: Icon(Icons.lock),
                  lasticon: IconButton(
                      onPressed: () {
                        toggles.value = !toggles.value;
                      },
                      icon: Icon(toggles.value
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  obscur: toggles.value,
                ),
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              Consumer<CreateYourNewPasswordss>(
                  builder: (context, value, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: providecontrol.checkButtons,
                            onChanged: (Newvalue) {
                              providecontrol.checfun(Newvalue!);
                            },
                          ),
                          Textcustam(text: ' Remember me')
                        ],
                      )),
              SizedBox(
                height: media.height * 0.01,
              ),
              RoundButton(
                title: 'Continue',
                fun: () {
                  successfun(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void successfun(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // title: Text(''),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 180,
                  width: 190,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/right.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Textcustam(
                  text: 'Congratulations!',
                  col: Colors.green,
                ),
                SizedBox(
                  height: 10,
                ),
                Textcustam(text: 'Your account is ready to use'),
                SizedBox(
                  height: 30,
                ),
                RoundButton(
                  title: 'Go to Homepage',
                  fun: () async {
                    var pref = await SharedPreferences.getInstance();
                    pref.setBool("LOGIN", true);

                    Navigator.pushNamed(context, '/BottomBarCus');
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
