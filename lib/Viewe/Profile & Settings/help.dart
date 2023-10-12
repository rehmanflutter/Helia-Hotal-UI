import 'package:flutter/material.dart';

import '../coustamWidget/textcustam.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Textcustam(
                    text: '  Select Language',
                    size: 24,
                    weight: FontWeight.w700,
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Textcustam(
                align: TextAlign.center,
                size: 15,
                weight: FontWeight.w500,
                text:
                    'Help Text:\n\n Text that appears as a sub-heading to the field label, but doesn’t appear in the field entry area. Enter help text in the Basic tab of the field’s sidebar menu ',
              ),
              SizedBox(
                height: 70,
              ),
              Textcustam(
                  align: TextAlign.center,
                  size: 15,
                  weight: FontWeight.w500,
                  text:
                      'Placeholder Text: \n\nText in the field entry area that isn’t submitted if the field is left untouched by the user'),
              SizedBox(
                height: 70,
              ),
              Textcustam(
                  size: 15,
                  weight: FontWeight.w500,
                  align: TextAlign.center,
                  text:
                      'Predefined Value:\n\n Text in the field entry area that is submitted if the field is left untouched by the user.')
            ],
          ),
        ),
      ),
    );
  }
}
