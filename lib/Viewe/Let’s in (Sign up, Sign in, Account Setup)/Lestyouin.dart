import 'package:flutter/material.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class LestYouIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
              height: media.height * 0.03,
            ),
            Center(
                child: Textcustam(
              text: 'enter'.tr(),
              weight: FontWeight.w500,
              size: 40,
            )),
            SizedBox(
              height: media.height * 0.08,
            ),
            Container(
              height: media.height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/facbook.png',
                    height: 24,
                    width: 24,
                  ),
                  Textcustam(
                    text: 'facbok'.tr(),
                    weight: FontWeight.w600,
                    size: 16,
                  )
                ],
              ),
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            Container(
              height: media.height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/Google.png',
                    height: 24,
                    width: 24,
                  ),
                  Textcustam(
                    text: 'gogal'.tr(),
                    weight: FontWeight.w600,
                    size: 16,
                  )
                ],
              ),
            ),
            SizedBox(
              height: media.height * 0.03,
            ),
            Container(
              height: media.height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/apple.png',
                    height: 24,
                    width: 24,
                  ),
                  Textcustam(
                    text: 'apple'.tr(),
                    weight: FontWeight.w600,
                    size: 16,
                  )
                ],
              ),
            ),
            SizedBox(
              height: media.height * 0.04,
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
              height: media.height * 0.04,
            ),
            RoundButton(
              title: 'sing'.tr(),
              fun: () {
                Navigator.pushNamed(context, '/SignLogin');
              },
            ),
            SizedBox(
              height: media.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Textcustam(
                  text: 'acount'.tr(),
                  col: Colors.grey,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/SignUpBank');
                    },
                    child: Textcustam(text: 'sign'.tr()))
              ],
            )
          ],
        ),
      ),
    );
  }
}
