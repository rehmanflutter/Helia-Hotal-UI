import 'package:flutter/material.dart';
import '../coustamWidget/Buttoncustam.dart';
import 'package:provider/provider.dart';

import '../../Controler/bookingcontrol.dart';
import '../coustamWidget/textcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class CancelHotelBookingpayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providercontrol =
        Provider.of<BookingProvider>(context, listen: false);
    final media = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                Textcustam(
                  text: 'canclehotalbok'.tr(),
                  weight: FontWeight.w700,
                  size: 24,
                )
              ],
            ),
            SizedBox(
              height: media.height * 0.04,
            ),
            Textcustam(text: 'pamantreturn'.tr()),
            SizedBox(
              height: media.height * 0.03,
            ),
            Container(
              height: media.height * 0.5,
              // color: Colors.amber,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 70,
                    margin: EdgeInsets.only(bottom: 10),
                    width: 380,
                    //  color: Colors.grey.shade100,
                    child: Center(
                        child: ListTile(
                      leading: Image.asset(
                          providercontrol.pamentreturn[index].image),
                      title: Textcustam(
                        text: "${providercontrol.pamentreturn[index].title}",
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                      trailing: Consumer<BookingProvider>(
                          builder: (context, value, child) => Radio(
                                value: index,
                                groupValue: providercontrol.selectedRadioIndex,
                                onChanged: (value) {
                                  providercontrol.setRadio(index);
                                },
                              )),
                    )),
                  );
                },
                itemCount: providercontrol.pamentreturn.length,
              ),
            ),
            SizedBox(
              height: media.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Textcustam(
                  text: 'Paid: \$479.5',
                  col: Colors.grey,
                ),
                Textcustam(
                  text: 'Refund  \$383.8 ',
                  size: 18,
                  weight: FontWeight.w700,
                )
              ],
            ),
            SizedBox(
              height: media.height * 0.02,
            ),
            RoundButton(
              title: 'confirm'.tr(),
              fun: () {
                successfun(context);
              },
            )
          ]),
        ),
      ),
    ));
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  text: 'success'.tr(),
                  col: Colors.green,
                ),
                SizedBox(
                  height: 10,
                ),
                Textcustam(
                  align: TextAlign.center,
                  text: 'fund'.tr(),
                ),
                SizedBox(
                  height: 30,
                ),
                RoundButton(
                  title: 'ok'.tr(),
                  fun: () {
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
