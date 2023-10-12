import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';

class OTP extends StatelessWidget {
  dynamic data;
  OTP({required this.data});
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

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
                    text: ' Forgot Password',
                    weight: FontWeight.w600,
                    size: 24,
                  )
                ],
              ),
              SizedBox(
                height: media.height * 0.170,
              ),
              Textcustam(
                text: data,
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: media.height * 0.06,
              ),
              Container(
                  margin: EdgeInsets.only(left: 10, right: 30),
                  child: Pinput(
                      length: 4,
                      defaultPinTheme: PinTheme(
                        width: 78,
                        height: 61,
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(30, 60, 87, 1),
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ))),
              SizedBox(
                height: media.height * 0.03,
              ),
              Textcustam(text: 'Resend code in 55 s'),
              SizedBox(
                height: media.height * 0.250,
              ),
              RoundButton(
                title: 'Verify',
                fun: () {
                  Navigator.pushNamed(context, '/CreateNewPassword');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
