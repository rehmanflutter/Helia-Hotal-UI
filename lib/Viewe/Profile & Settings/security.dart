import 'package:flutter/material.dart';
import '../coustamWidget/Buttoncustam.dart';
import 'package:provider/provider.dart';

import '../../Controler/profilesettingcontrol.dart';
import 'package:easy_localization/easy_localization.dart';

import '../coustamWidget/textcustam.dart';

class Security extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final control = Provider.of<Profilesettinglist>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new)),
                  Textcustam(
                    text: 'security'.tr(),
                    size: 24,
                    weight: FontWeight.w700,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 200,
                  // color: Colors.amber,
                  child: Consumer<Profilesettinglist>(
                    builder: (context, value, child) => ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Textcustam(
                              text: '${value.Securitylist[index]}'.tr(),
                              size: 18,
                              weight: FontWeight.w600,
                            ),
                            trailing: Switch(
                              value: value.Securitylistoptuin[index],
                              onChanged: (newValue) {
                                value.switchFunSecurity(newValue, index);
                              },
                            ),
                          );
                        },
                        itemCount: control.Securitylist.length),
                  )),
              ListTile(
                title: Textcustam(
                  text: 'googlauthenticator'.tr(),
                  size: 18,
                  weight: FontWeight.w600,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                title: 'changepassword'.tr(),
                textcolor: Colors.green,
                col: Colors.blue.shade50,
                fun: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
