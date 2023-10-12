import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controler/hotalResevationcontrol.dart';
import '../../Controler/hotalbookdatesetticket.dart';
import '../../Controler/profilesettingcontrol.dart';
import '../../Controler/searchcontrol.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class BookingConfirmPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controlProvidersarch =
        Provider.of<SearchProvider>(context, listen: false);
    final media = MediaQuery.of(context).size;
    final providercontrol =
        Provider.of<Nameresevertion>(context, listen: false);
    final controller =
        Provider.of<HotalBookDatesetTicket>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    Textcustam(
                      text: 'payment'.tr(),
                      size: 24,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Container(
                  height: 140,
                  child: Container(
                    height: 140,
                    margin: EdgeInsets.only(bottom: 20),
                    //   color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(controlProvidersarch
                                      .listwo[controlProvidersarch
                                          .SelestListtoIndex]
                                      .images),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 110,
                          width: media.width * 0.550,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Textcustam(
                                    text: controlProvidersarch
                                        .listwo[controlProvidersarch
                                            .SelestListtoIndex]
                                        .title,
                                    size: 19,
                                    weight: FontWeight.w700,
                                  ),
                                  Textcustam(
                                    text:
                                        '\$${controlProvidersarch.listwo[controlProvidersarch.SelestListtoIndex].price}',
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
                                    text: controlProvidersarch
                                        .listwo[controlProvidersarch
                                            .SelestListtoIndex]
                                        .country
                                        .toString(),
                                  ),
                                  Textcustam(text: '/ night')
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
                                        text: controlProvidersarch
                                            .listwo[controlProvidersarch
                                                .SelestListtoIndex]
                                            .rating,
                                        col: Colors.green,
                                      ),
                                      Textcustam(
                                        text:
                                            '( ${controlProvidersarch.listwo[controlProvidersarch.SelestListtoIndex].review} reviews)',
                                        col: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.bookmark_border_outlined,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Themchangecolor.lightmoods == true
                        ? Colors.grey.shade100
                        : Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textcustam(
                              text: 'checkin'.tr(),
                              weight: FontWeight.w600,
                            ),
                            Textcustam(
                              text:
                                  '${controller.selectedDateRange?.startDate != null ? controller.getFormattedDate(controller.selectedDateRange.startDate) : "Select Start date"}',
                              size: 18,
                              weight: FontWeight.w700,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textcustam(
                              text: 'checkout'.tr(),
                              weight: FontWeight.w600,
                            ),
                            Textcustam(
                              text:
                                  '${controller.selectedDateRange?.endDate != null ? controller.getFormattedDate(controller.selectedDateRange.endDate) : "Select Last date"}',
                              size: 18,
                              weight: FontWeight.w700,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textcustam(
                              text: 'guest'.tr(),
                              weight: FontWeight.w600,
                            ),
                            Textcustam(
                              text: "${controller.Guestcount}",
                              size: 18,
                              weight: FontWeight.w700,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.03,
                ),
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Themchangecolor.lightmoods == true
                        ? Colors.grey.shade100
                        : Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textcustam(
                              text: 'pernight'.tr(),
                              weight: FontWeight.w600,
                            ),
                            Textcustam(
                              text: '\$ ${controller.roomprices}',
                              size: 18,
                              weight: FontWeight.w700,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textcustam(
                              text: 'less'.tr(),
                              weight: FontWeight.w600,
                            ),
                            Textcustam(
                              text: '\$ ${controller.textprice}',
                              size: 18,
                              weight: FontWeight.w700,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textcustam(
                              text: 'total'.tr(),
                              weight: FontWeight.w600,
                            ),
                            Consumer<HotalBookDatesetTicket>(
                                builder: (context, value, child) {
                              value.calculateTotal();
                              return Textcustam(
                                text: '${value.total}',
                                size: 18,
                                weight: FontWeight.w700,
                              );
                            })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                ListTile(
                  leading: Image.asset(providercontrol
                      .pamentreturn[providercontrol.selectIndex].image),
                  title: Textcustam(
                      text: providercontrol
                          .pamentreturn[providercontrol.selectIndex].title),
                  trailing: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Textcustam(text: 'Change')),
                ),
                SizedBox(
                  height: media.height * 0.01,
                ),
                RoundButton(
                  title: 'pacom'.tr(),
                  fun: () {
                    successfun(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void successfun(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // title: Text(''),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 180,
                  width: 190,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/right.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Textcustam(
                  text: 'Payment Successfull!',
                  col: Colors.green,
                  size: 22,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 15,
                ),
                Textcustam(
                  text: 'Successfully made payment and hotel booking',
                  align: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                RoundButton(
                  title: 'View Ticket',
                  fun: () {
                    Navigator.pushNamed(context, '/TicketView');
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RoundButton(
                  title: 'Cancel',
                  col: Colors.blue.shade50,
                  textcolor: Colors.green,
                  fun: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
