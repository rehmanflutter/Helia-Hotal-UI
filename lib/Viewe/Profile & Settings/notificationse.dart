import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controler/profilesettingcontrol.dart';
import 'package:easy_localization/easy_localization.dart';

import '../coustamWidget/textcustam.dart';

class NotificationSetting extends StatelessWidget {
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
                      icon: Icon(Icons.arrow_back)),
                  Textcustam(
                    text: 'notification'.tr(),
                    size: 24,
                    weight: FontWeight.w700,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 500,
                  //color: Colors.amber,

                  child: Consumer<Profilesettinglist>(
                    builder: (context, value, child) => ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Textcustam(
                              text: '${value.notificationlist[index]}'.tr(),
                              size: 18,
                              weight: FontWeight.w500,
                            ),
                            trailing: CupertinoSwitch(
                              value: value.notificationList[index],
                              onChanged: (newValue) {
                                value.switchFun(newValue, index);
                              },
                            ),
                          );
                        },
                        itemCount: control.notificationlist.length),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
