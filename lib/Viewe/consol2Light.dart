import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Controler/controler.dart';
import 'coustamWidget/Buttoncustam.dart';
import 'coustamWidget/textcustam.dart';

class Consol2Light extends StatelessWidget {
  const Consol2Light({super.key});

  @override
  Widget build(BuildContext context) {
    final providecontrol = Provider.of<Consol2Pageview>(context, listen: false);
    final media = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: providecontrol.pageControllers,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    height: media.height * 0.8,
                    // color: Colors.amber,
                  ),
                  Container(
                    width: double.infinity,
                    height: media.height * 0.550,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                providecontrol.pageview2[index].image),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 250,
                    left: 10,
                    child: Container(
                      width: media.width * 0.360,
                      child: Textcustam(
                        text: providecontrol.pageview2[index].title.toString(),
                        size: 30,
                        weight: FontWeight.w700,
                        align: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.02,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    right: 10,
                    child: Container(
                      width: media.width * 0.8,
                      child: Textcustam(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        align: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: providecontrol.pageview2.length,
          ),
        ),
        SizedBox(
          height: media.height * 0.01,
        ),
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
          height: media.height * 0.02,
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
                  Navigator.pushNamed(context, '/LestYouIn');
                },
              ),
              SizedBox(
                height: media.height * 0.01,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
