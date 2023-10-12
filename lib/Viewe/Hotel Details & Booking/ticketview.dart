import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import '../coustamWidget/Buttoncustam.dart';
import 'package:provider/provider.dart';

import '../../Controler/controler.dart';
import '../../Controler/hotalbookdatesetticket.dart';
import '../../Controler/searchcontrol.dart';
import '../coustamWidget/textcustam.dart';

class TicketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<HotalBookDatesetTicket>(context, listen: false);
    final controlProviders =
        Provider.of<SearchProvider>(context, listen: false);

    final profileProviders =
        Provider.of<Forgetliststing>(context, listen: false);

    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      text: 'Ticket',
                      size: 24,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Container(
                  height: media.height * 0.730,
                  width: media.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                        Textcustam(
                          text: 'Royale President Hotel',
                          size: 20,
                          weight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                        Container(
                            height: 216,
                            width: 216,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/qrk.png'),
                                    fit: BoxFit.fill))),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                        DottedDashedLine(
                          height: 0,
                          width: media.width * 0.8,
                          axis: Axis.horizontal,
                          dashColor: Colors.grey,
                        ),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 56,
                              width: 120,
                              //   color: Colors.amber,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Textcustam(
                                    text: 'Name',
                                    weight: FontWeight.w400,
                                  ),
                                  Textcustam(
                                    text:
                                        '${profileProviders.nametext.text.toString()}',
                                    size: 17,
                                    weight: FontWeight.w600,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 56,
                              width: 120,
                              // color: Colors.amber,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Textcustam(
                                    text: 'Phone Number',
                                    weight: FontWeight.w400,
                                  ),
                                  Textcustam(
                                    text:
                                        '${profileProviders.phoneno.text.toString()}',
                                    size: 17,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60,
                              width: 120,
                              // color: Colors.amber,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Textcustam(
                                    text: 'Check in',
                                    weight: FontWeight.w400,
                                  ),
                                  Textcustam(
                                    text:
                                        '${controller.selectedDateRange?.startDate != null ? controller.getFormattedDate(controller.selectedDateRange.startDate) : "Select Start date"}',
                                    size: 17,
                                    weight: FontWeight.w600,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 120,
                              // color: Colors.amber,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Textcustam(
                                    text: 'Check out',
                                    weight: FontWeight.w400,
                                  ),
                                  Textcustam(
                                    text:
                                        '${controller.selectedDateRange?.endDate != null ? controller.getFormattedDate(controller.selectedDateRange.endDate) : "Select Last date"}',
                                    size: 17,
                                    weight: FontWeight.w600,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60,
                              width: 120,
                              // color: Colors.amber,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Textcustam(
                                    text: 'Hotel',
                                    weight: FontWeight.w400,
                                  ),
                                  Textcustam(
                                    text: controlProviders
                                        .listwo[
                                            controlProviders.SelestListtoIndex]
                                        .title,
                                    size: 16,
                                    weight: FontWeight.w600,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 120,
                              // color: Colors.amber,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Textcustam(
                                    text: 'Guest',
                                    weight: FontWeight.w400,
                                  ),
                                  Textcustam(
                                    text: '${controller.Guestcount}',
                                    size: 18,
                                    weight: FontWeight.w600,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.05,
                ),
                RoundButton(
                  title: 'Download Ticket',
                  fun: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
