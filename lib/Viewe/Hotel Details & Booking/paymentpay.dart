import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controler/hotalResevationcontrol.dart';
import '../../Controler/profilesettingcontrol.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';

class PaymentPaychose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final providercontrol =
        Provider.of<Nameresevertion>(context, listen: false);
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
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
                              text: 'pament'.tr(),
                              size: 24,
                              weight: FontWeight.w700,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textcustam(
                              text: 'paymentmethods'.tr(),
                              size: 18,
                              weight: FontWeight.w700,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/NewCard');
                                },
                                child: Textcustam(
                                    text: 'newcard'.tr(),
                                    size: 16,
                                    weight: FontWeight.w700))
                          ],
                        ),
                        SizedBox(
                          height: media.height * 0.03,
                        ),
                        Container(
                          height: media.height * 0.5,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Container(
                                height: 70,
                                margin: EdgeInsets.only(bottom: 10),
                                width: 380,
                                // color: Themchangecolor.lightmoods == true
                                //     ? Colors.grey.shade100
                                //     : Colors.black,
                                child: Center(
                                    child: ListTile(
                                  leading: Image.asset(providercontrol
                                      .pamentreturn[index].image),
                                  title: Textcustam(
                                    text: providercontrol
                                        .pamentreturn[index].title
                                        .toString(),
                                    size: 18,
                                    weight: FontWeight.w700,
                                  ),
                                  trailing: Consumer<Nameresevertion>(
                                      builder: (context, value, child) => Radio(
                                            value: index,
                                            groupValue: providercontrol
                                                .selectedRadioIndex,
                                            onChanged: (value) {
                                              providercontrol.selectIndex =
                                                  index;
                                              providercontrol.setRadio(index);
                                            },
                                          )),
                                )),
                              );
                            },
                            itemCount: providercontrol.pamentreturn.length - 1,
                          ),
                        ),
                        SizedBox(
                          height: media.height * 0.04,
                        ),
                        RoundButton(
                          title: 'continuebtn'.tr(),
                          fun: () {
                            Navigator.pushNamed(
                                context, '/BookingConfirmPayment');
                          },
                        )
                      ]),
                ))));
  }
}
