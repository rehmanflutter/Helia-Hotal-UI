import 'package:flutter/material.dart';
import '../coustamWidget/Buttoncustam.dart';

import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Controler/bookingcontrol.dart';
import '../../Controler/profilesettingcontrol.dart';
import '../coustamWidget/textcustam.dart';
import 'payment.dart';

// }
class MyBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controler = Provider.of<BookingProvider>(context, listen: false);
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
                      text: 'mybooking'.tr(),
                      weight: FontWeight.w700,
                      size: 24,
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))
                  ],
                )
              ],
            ),
            SizedBox(
              height: media.height * 0.04,
            ),

            Container(
              height: media.height * 0.06,
              child: Consumer<BookingProvider>(
                builder: (context, value, child) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    bool select = index == controler.itemSelect3;

                    return InkWell(
                      onTap: () {
                        controler.selectFunction(index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: select ? Colors.green : null,
                          border: Border.all(width: 2.0, color: Colors.green),
                        ),
                        child: Center(
                          child: Textcustam(
                            text: '${controler.bottom3[index]}'.tr(),
                            col: select ? Colors.white : Colors.green,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: controler.bottom3.length,
                ),
              ),
            ),

//1st List
            Consumer<BookingProvider>(
              builder: (context, value, child) {
                if (value.itemSelect3 == 0) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Themchangecolor.lightmoods == true
                            //     ? Colors.grey.shade100
                            //     : Colors.black,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(controler
                                                .Viewbooking[index].image),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    height: 110,
                                    width: media.width * 0.550,
                                    //  color: Colors.blue,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Textcustam(
                                          text:
                                              '${controler.Viewbooking[index].title}'
                                                  .tr(),
                                          size: 19,
                                          weight: FontWeight.w700,
                                        ),
                                        Textcustam(
                                          text:
                                              '( ${controler.Viewbooking[index].suntile})'
                                                  .tr(),
                                          col: Colors.grey,
                                        ),
                                        Container(
                                          height: 24,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.green.shade100,
                                          ),
                                          child: Center(
                                            child: Textcustam(
                                              text: 'paid'.tr(),
                                              size: 10,
                                              col: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      height: 38,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          fun(context);
                                        },
                                        child:
                                            Textcustam(text: 'bookingcal'.tr()),
                                        style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            )),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: RoundButton(
                                      title: 'viewticket'.tr(),
                                      fun: () {},
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: controler.Viewbooking.length,
                    ),
                  );
                } else if (value.itemSelect3 == 1) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Themchangecolor.lightmoods == true
                            //     ? Colors.grey.shade100
                            //     : Colors.black,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(controler
                                                .completroom[index].image),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    height: 110,
                                    width: media.width * 0.550,
                                    // color: Colors.blue,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Textcustam(
                                          text:
                                              '${controler.completroom[index].title}'
                                                  .tr(),
                                          size: 19,
                                          weight: FontWeight.w700,
                                        ),
                                        Textcustam(
                                          text:
                                              '(${controler.completroom[index].suntile})'
                                                  .tr(),
                                          col: Colors.grey,
                                        ),
                                        Container(
                                          height: 24,
                                          width: 124,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.green.shade200,
                                          ),
                                          child: Center(
                                            child: Textcustam(
                                              text: 'Completed'.tr(),
                                              size: 12,
                                              col: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(height: 30),
                              Container(
                                width: 340,
                                height: 34,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green.shade200,
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Icons.check_box,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Textcustam(
                                        text: 'comit'.tr(),
                                        size: 12,
                                        col: Colors.green,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: controler.completroom.length,
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Themchangecolor.lightmoods == true
                            //     ? Colors.grey.shade100
                            //     : Colors.black,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(controler
                                                .bookingroomalread[index]
                                                .image),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    height: 110,
                                    width: media.width * 0.550,
                                    // color: Colors.blue,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Textcustam(
                                          text:
                                              '${controler.bookingroomalread[index].title}'
                                                  .tr(),
                                          size: 19,
                                          weight: FontWeight.w700,
                                        ),
                                        Textcustam(
                                          text:
                                              '( ${controler.bookingroomalread[index].suntile})'
                                                  .tr(),
                                          col: Colors.grey,
                                        ),
                                        Container(
                                          height: 24,
                                          width: 124,
                                          color: Colors.red.shade200,
                                          child: Center(
                                            child: Textcustam(
                                              text: 'calhotal'.tr(),
                                              size: 12,
                                              col: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(height: 30),
                              Container(
                                width: 340,
                                height: 34,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red.shade200,
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Textcustam(
                                        text: 'thiscal'.tr(),
                                        size: 12,
                                        col: Colors.red,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: controler.bookingroomalread.length,
                    ),
                  );
                }
              },
            )

// 2nd List

            // 3rd List
            //
          ],
        ),
      ),
    );
  }

  void fun(BuildContext context) async {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Textcustam(
                text: 'canclebook'.tr(),
                size: 24,
                weight: FontWeight.w700,
                col: Colors.red,
              ),
              Divider(
                height: 40,
              ),
              Textcustam(
                align: TextAlign.center,
                text: 'shur'.tr(),
                size: 20,
                weight: FontWeight.w700,
              ),
              SizedBox(
                height: 30,
              ),
              Textcustam(
                align: TextAlign.center,
                text: 'comfirm'.tr(),
                col: Colors.grey,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 38,
                    width: 160,
                    child: RoundButton(
                      title: 'cancels'.tr(),
                      col: Colors.blue.shade50,
                      textcolor: Colors.green,
                      fun: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    height: 38,
                    width: 160,
                    child: RoundButton(
                      title: 'continue'.tr(),
                      fun: () {
                        // Navigator.pushNamed(
                        //     context, '/CancelHotelBookingpayment');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CancelHotelBookingpayment(),
                            ));
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        );
      },
    );
  }
}
