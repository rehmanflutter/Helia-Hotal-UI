import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../Controler/homecontrolstart.dart';
import '../coustamWidget/textcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class Bookeds extends StatelessWidget {
  const Bookeds({super.key});

  @override
  Widget build(BuildContext context) {
    final controlProviders = Provider.of<Homecontrol>(context, listen: false);
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: media.height * 0.048,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      Textcustam(
                        text: 'resent'.tr(),
                        weight: FontWeight.w700,
                        size: 24,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.document_scanner,
                            color: Colors.green,
                          )),
                    ],
                  )
                ],
              ),
              Container(
                  height: media.height * 0.9,
                  child: Consumer<Homecontrol>(
                    builder: (context, value, child) => ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 140,
                          margin: EdgeInsets.only(bottom: 20),
                          //   color: Colors.red,
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(controlProviders
                                            .listthree[index].images),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                height: 110,
                                width: media.width * 0.6,
                                // color: Colors.blue,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Textcustam(
                                          text:
                                              '${controlProviders.listthree[index].title}'
                                                  .tr(),
                                          size: 19,
                                          weight: FontWeight.w700,
                                        ),
                                        Textcustam(
                                          text:
                                              '\$${controlProviders.listthree[index].price}',
                                          size: 24,
                                          weight: FontWeight.w700,
                                          col: Colors.green,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Textcustam(
                                          text: 'hotal10'.tr(),
                                        ),
                                        Textcustam(text: 'pernight'.tr())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Textcustam(
                                              text: controlProviders
                                                  .listthree[index].rating,
                                              col: Colors.green,
                                            ),
                                            Textcustam(
                                              text:
                                                  '( ${controlProviders.listthree[index].review} reviews)',
                                              col: Colors.grey,
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              if (value.like.contains(index)) {
                                                value.dislikevedio(index);
                                              } else {
                                                value.likevedio(index);
                                              }
                                            },
                                            icon: Icon(
                                              value.like.contains(index)
                                                  ? Icons.bookmark
                                                  : Icons
                                                      .bookmark_border_outlined,
                                              color: Colors.green,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: controlProviders.listthree.length,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
