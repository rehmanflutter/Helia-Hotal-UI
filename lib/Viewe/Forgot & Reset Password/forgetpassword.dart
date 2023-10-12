import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider/provider.dart';

import '../../Controler/controler.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controlprovide = Provider.of<Forgetliststing>(context, listen: false);
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
                  icon: Icon(Icons.arrow_back),
                ),
                Textcustam(
                  text: ' Forgot Password',
                  weight: FontWeight.w600,
                  size: 24,
                ),
              ],
            ),
            SizedBox(
              height: media.height * 0.02,
            ),
            Container(
              height: 190,
              width: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/lock.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: media.height * 0.01,
            ),
            Textcustam(
              text:
                  'Select which contact details should we use to reset your password',
              weight: FontWeight.w400,
            ),
            // SizedBox(
            //   height: media.height * 0.01,
            // ),
            Expanded(
                child: Consumer<Forgetliststing>(
              builder: (context, value, child) => ListView.builder(
                // physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  bool select = index == controlprovide.selectedItemIndex;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        value.selectItem(index);
                      },
                      child: Container(
                        height: media.height * 0.128,
                        width: media.width * 0.380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: select ? 2.2 : 0.8,
                            color: select ? Colors.green : Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: ListTile(
                            leading: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.shade50,
                              ),
                              child: Center(
                                child: Image.asset(
                                  controlprovide.listchose[index].image
                                      .toString(),
                                ),
                              ),
                            ),
                            title: Textcustam(
                              text: controlprovide.listchose[index].title,
                              col: Colors.grey,
                            ),
                            subtitle: Textcustam(
                              text: controlprovide.listchose[index].subtitle
                                  .toString(),
                              col: Colors.black,
                              weight: FontWeight.w700,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: controlprovide.listchose.length,
              ),
            )),
            RoundButton(
              title: 'Continue',
              fun: () {
                if (controlprovide.selectedItemIndex != -1) {
                  // Only navigate to OTP if an item is selected
                  String? selectedSubtitle = controlprovide
                      .listchose[controlprovide.selectedItemIndex].subtitle;
                  Navigator.pushNamed(context, '/OTP',
                      arguments: selectedSubtitle);
                } else {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
