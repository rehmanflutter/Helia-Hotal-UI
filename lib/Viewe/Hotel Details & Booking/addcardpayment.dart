import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controler/hotalResevationcontrol.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';

class NewPamentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final providercontrol =
        Provider.of<Nameresevertion>(context, listen: false);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Textcustam(
                  text: 'Payment',
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
                  text: 'Payment Methods',
                  size: 18,
                  weight: FontWeight.w700,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/NewCard');
                    },
                    child: Textcustam(
                        text: 'Add New Card',
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
                    //    color: Colors.grey.shade100,
                    child: Center(
                        child: ListTile(
                      leading: Image.asset(
                          providercontrol.pamentreturn[index].image),
                      title: Textcustam(
                        text: providercontrol.pamentreturn[index].title
                            .toString(),
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                      trailing: Consumer<Nameresevertion>(
                          builder: (context, value, child) => Radio(
                                value: index,
                                groupValue: providercontrol.selectedRadioIndex,
                                onChanged: (value) {
                                  providercontrol.selectIndex = index;
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
              height: media.height * 0.04,
            ),
            RoundButton(
              title: 'Continue',
              fun: () {
                Navigator.pushNamed(context, '/BookingConfirmPayment');
              },
            )
          ])),
    )));
  }
}
