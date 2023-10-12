import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../coustamWidget/Buttoncustam.dart';

import 'package:provider/provider.dart';

import '../../Controler/controler.dart';
import '../coustamWidget/textcustam.dart';
import '../coustamWidget/textfiledcustam.dart';

class SignUpBank extends StatelessWidget {
  const SignUpBank({super.key});

  @override
  Widget build(BuildContext context) {
    final controler = Provider.of<SignUpBankPro>(context, listen: false);
    ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: media.height * 0.048,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_rounded)),
              SizedBox(
                height: media.height * 0.02,
              ),
              Textcustam(
                text: 'creat'.tr(),
                weight: FontWeight.w500,
                size: 45,
              ),
              SizedBox(
                height: media.height * 0.04,
              ),
              Textfiledcustam(
                hinttext: 'Email'.tr(),
                starticon: Icon(Icons.email),
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context, value, child) => Textfiledcustam(
                  hinttext: 'Password'.tr(),
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
                height: media.height * 0.01,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Consumer<SignUpBankPro>(
                  builder: (context, value, child) => Checkbox(
                    value: value.checkBoxValues,
                    onChanged: (newValue) {
                      value.boxvalue(newValue!);
                    },
                  ),
                ),
                Textcustam(text: 'Remember'.tr())
              ]),
              SizedBox(
                height: media.height * 0.01,
              ),
              RoundButton(
                title: 'sign'.tr(),
                fun: () {
                  Navigator.pushNamed(context, '/FillYourProfile');
                },
              ),
              SizedBox(
                height: media.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  Textcustam(text: 'or'.tr()),
                  Expanded(child: Divider(color: Colors.grey))
                ],
              ),
              SizedBox(
                height: media.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey)),
                      child: Center(
                        child: Image.asset(
                          'images/facbook.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Center(
                        child: Image.asset('images/Google.png'),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Center(
                        child: Image.asset('images/apple.png'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: media.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textcustam(
                    text: 'ac'.tr(),
                    col: Colors.grey,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/SignLogin');
                      },
                      child: Textcustam(text: 'sinin'.tr()))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
