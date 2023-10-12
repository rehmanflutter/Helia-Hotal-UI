import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../Controler/homecontrolstart.dart';
import '../../Controler/profilesettingcontrol.dart';
import '../coustamWidget/textcustam.dart';
import 'booking.dart';
import 'likeitem.dart';
import 'notification.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controlProviders = Provider.of<Homecontrol>(context, listen: false);
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: media.height * 0.048,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('images/homepic.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Textcustam(
                        text: 'namehotal'.tr(),
                        weight: FontWeight.w700,
                        size: 24,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Notificationss');
                          },
                          icon: Icon(Icons.notifications_none)),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Likes');
                          },
                          icon: Icon(Icons.bookmark_border_outlined))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: media.height * 0.04,
              ),
              Textcustam(
                text: 'hello'.tr(),
                weight: FontWeight.w700,
                size: 30,
              ),
              SizedBox(
                height: media.height * 0.02,
              ),

              Container(
                height: 50,
                color: Themchangecolor.lightmoods == true
                    ? Colors.grey.shade100
                    : Colors.black,
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/SearchHotal');
                  },
                  leading: Icon(Icons.search),
                  title: Textcustam(
                    text: 'search'.tr(),
                    col: Colors.grey,
                  ),
                  trailing: Icon(Icons.flight_land_outlined),
                ),
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              Container(
                  height: media.height * 0.04,
                  child: Consumer<Homecontrol>(
                    builder: (context, value, child) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        bool select = index == controlProviders.itemselect;

                        return InkWell(
                          onTap: () {
                            controlProviders.funslect(index);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: select ? Colors.green : null,
                              border:
                                  Border.all(width: 2.0, color: Colors.green),
                            ),
                            child: Center(
                                child: Textcustam(
                              text:
                                  '${controlProviders.selectrlist[index]}'.tr(),
                              col: select ? Colors.white : Colors.green,
                            )),
                          ),
                        );
                      },
                      itemCount: controlProviders.selectrlist.length,
                    ),
                  )),
              SizedBox(
                height: media.height * 0.03,
              ),
              Container(
                height: media.height * 0.4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: media.height * 0.4,
                          margin: EdgeInsets.only(right: 20),
                          width: media.width * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                    controlProviders.listTwo[index].image),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 30,
                          child: Container(
                            height: 32,
                            width: 71,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Textcustam(
                                    text: '4.8  ',
                                    col: Colors.white,
                                  )
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Textcustam(
                                text:
                                    '${controlProviders.listTwo[index].titile}'
                                        .tr(),
                                col: Colors.white,
                                size: 22,
                                weight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: media.height * 0.01,
                              ),
                              Textcustam(
                                text: 'con4'.tr(),
                                col: Colors.white,
                              ),
                              SizedBox(
                                height: media.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Textcustam(
                                    text:
                                        '\$ ${controlProviders.listTwo[index].price} ',
                                    size: 24,
                                    weight: FontWeight.w700,
                                    col: Colors.white,
                                  ),
                                  Textcustam(
                                    text: 'pernight'.tr(),
                                    col: Colors.white,
                                  ),
                                  SizedBox(
                                    width: media.width * 0.1,
                                  ),
                                  Icon(
                                    Icons.bookmark_border_outlined,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: media.height * 0.02,
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: controlProviders.listTwo.length,
                ),
              ),
              SizedBox(
                height: media.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textcustam(
                    text: 'resent'.tr(),
                    size: 18,
                    weight: FontWeight.w600,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Bookeds(),
                            ));
                      },
                      child: Textcustam(text: 'seeall'.tr()))
                ],
              ),

              // see list to chose faverate

              Container(
                  height: 1200,
                  //  color: Colors.amber,
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
                                            Row(
                                              children: [
                                                Textcustam(
                                                  text:
                                                      ' ${controlProviders.listthree[index].review} ',
                                                  col: Colors.grey,
                                                ),
                                                Text('revie'.tr())
                                              ],
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
