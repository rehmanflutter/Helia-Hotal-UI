import 'package:flutter/material.dart';
import '../Controler/controler.dart';

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'coustamWidget/Buttoncustam.dart';
import 'coustamWidget/textcustam.dart';

class LightCarouselV1 extends StatelessWidget {
  const LightCarouselV1({super.key});

  @override
  Widget build(BuildContext context) {
    final providecontrol = Provider.of<CountProvied>(context, listen: false);

    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: providecontrol.pageControllers,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: media.height * 0.400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  providecontrol.pageviewcontrol[index].image),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      height: media.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Textcustam(
                            text: providecontrol.pageviewcontrol[index].title
                                .toString(),
                            size: 30,
                            weight: FontWeight.w700,
                            align: TextAlign.center,
                          ),
                          SizedBox(
                            height: media.height * 0.02,
                          ),
                          Textcustam(
                            text:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            align: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: providecontrol.pageviewcontrol.length,
            ),
          ),
          // SizedBox(
          //   height: media.height * 0.02,
          // ),
          SmoothPageIndicator(
            controller: providecontrol.pageControllers,
            count: 3,
            axisDirection: Axis.horizontal,
            effect: SlideEffect(
                spacing: 8.0,
                radius: 4.0,
                dotWidth: 15.0,
                dotHeight: 12.0,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.green),
          ),
          SizedBox(
            height: media.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                RoundButton(
                  title: 'Next',
                  fun: () {
                    providecontrol.pageControllers.nextPage(
                        duration: Duration(seconds: 1), curve: Curves.ease);
                  },
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                RoundButton(
                  title: 'Skip',
                  col: Colors.blue.shade50,
                  textcolor: Colors.green,
                  fun: () {
                    Navigator.pushNamed(context, '/Splish2');
                  },
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
