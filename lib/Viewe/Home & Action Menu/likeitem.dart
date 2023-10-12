import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../Controler/homecontrolstart.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class Likes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controlProviders = Provider.of<Homecontrol>(context, listen: false);
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
                      text: 'mybookmark'.tr(),
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
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.window_outlined))
                  ],
                )
              ],
            ),
            Consumer<Homecontrol>(
                builder: (context, value, child) => Expanded(
                      child: GridView.builder(
                        itemBuilder: (context, index) {
                          int Likeindex = value.like[index];
                          return InkWell(
                            onTap: () {
                              fun(context, Likeindex);
                            },
                            child: Container(
                              //  color: Colors.grey.shade100,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(controlProviders
                                                  .listthree[Likeindex].images),
                                              fit: BoxFit.cover)),
                                    ),
                                    Textcustam(
                                      text: controlProviders
                                          .listthree[Likeindex].title,
                                      size: 19,
                                      weight: FontWeight.w700,
                                    ),
                                    SizedBox(
                                      height: media.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Textcustam(
                                          text: controlProviders
                                              .listthree[Likeindex].rating,
                                          col: Colors.green,
                                        ),
                                        Textcustam(
                                          text:
                                              '( ${controlProviders.listthree[Likeindex].review})',
                                          col: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: media.height * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Textcustam(
                                          text:
                                              '\$${controlProviders.listthree[Likeindex].price}',
                                          size: 24,
                                          weight: FontWeight.w700,
                                          col: Colors.green,
                                        ),
                                        Icon(
                                          Icons.bookmark,
                                          color: Colors.green,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 260),
                        itemCount: controlProviders.like.length,
                      ),
                    ))
          ],
        ),
      ),
    );
  }

  void fun(BuildContext context, int index) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        final controlProviders =
            Provider.of<Homecontrol>(context, listen: false);
        final media = MediaQuery.of(context).size;

        return Container(
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          height: media.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: media.height * 0.01,
                ),
                Textcustam(
                  text: 'Remove from Bookmark?',
                  size: 24,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Container(
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
                                image: AssetImage(
                                    controlProviders.listthree[index].images),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: 110,
                        width: media.width * 0.6,
                        // color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Textcustam(
                                  text: controlProviders.listthree[index].title,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Textcustam(
                                  text: 'Amsterdam, Netherlands',
                                ),
                                Textcustam(text: '/ night')
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Icon(
                                  Icons.bookmark,
                                  color: Colors.green,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Consumer<Homecontrol>(
                  builder: (context, value, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: RoundButton(
                            title: 'Cancel',
                            col: Colors.blue.shade50,
                            textcolor: Colors.green,
                            fun: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: RoundButton(
                            title: 'Yes, Remove',
                            fun: () {
                              if (value.like.contains(index)) {
                                value.dislikevedio(index);
                                Navigator.pop(context);
                              } else {
                                value.likevedio(index);
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
