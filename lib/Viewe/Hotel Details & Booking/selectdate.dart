import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../Controler/hotalbookdatesetticket.dart';
import '../../Controler/profilesettingcontrol.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';
import 'package:easy_localization/easy_localization.dart';

// Import your custom classes here (HotalBookDatesetTicket and Textcustam)

class SelectDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<HotalBookDatesetTicket>(context, listen: false);
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      text: 'selectdaee'.tr(),
                      size: 24,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  height: media.height * 0.01,
                ),
                Consumer<HotalBookDatesetTicket>(
                  builder: (context, value, child) => Column(
                    children: [
                      Container(
                        height: 300,
                        width: 380,
                        child: SfDateRangePicker(
                          backgroundColor: Themchangecolor.lightmoods == true
                              ? Colors.blue.shade100
                              : Colors.black,
                          selectionMode: value.selectionMode,
                          onSelectionChanged:
                              (DateRangePickerSelectionChangedArgs args) {
                            value.updateSelectedDateRange(
                                args); // Update and notify
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 90,
                            width: 140,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Textcustam(
                                  text: 'checkin'.tr(),
                                  size: 18,
                                  weight: FontWeight.w700,
                                ),
                                Container(
                                  height: 56,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Themchangecolor.lightmoods == true
                                        ? Colors.grey.shade100
                                        : Colors.black,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${value.selectedDateRange?.startDate != null ? value.getFormattedDate(value.selectedDateRange.startDate) : "Select Start date"}',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward),
                          Container(
                            height: 90,
                            width: 140,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Textcustam(
                                  text: 'checkout'.tr(),
                                  size: 18,
                                  weight: FontWeight.w700,
                                ),
                                Container(
                                  height: 56,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Themchangecolor.lightmoods == true
                                        ? Colors.grey.shade100
                                        : Colors.black,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${value.selectedDateRange?.endDate != null ? value.getFormattedDate(value.selectedDateRange.endDate) : "Select Last date"}',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Textcustam(
                  text: 'guest'.tr(),
                  size: 18,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Container(
                    height: 76,
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade200)),
                    child: Consumer<HotalBookDatesetTicket>(
                      builder: (context, value, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 52,
                            width: 52,
                            child: RoundButton(
                              title: '-',
                              col: Colors.blue.shade50,
                              textcolor: Colors.green,
                              fun: () {
                                value.funGuestremove();
                              },
                            ),
                          ),
                          Textcustam(
                            text: '${value.Guestcount}',
                            size: 24,
                            weight: FontWeight.w700,
                          ),
                          Container(
                            height: 52,
                            width: 52,
                            child: RoundButton(
                              title: '+',
                              col: Colors.blue.shade50,
                              textcolor: Colors.green,
                              fun: () {
                                value.funGuestadd();
                              },
                            ),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: media.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Textcustam(
                      text: 'total'.tr(),
                      weight: FontWeight.w700,
                      size: 20,
                    ),
                    Textcustam(
                      text: ': \$${controller.roomprices}',
                      weight: FontWeight.w700,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                RoundButton(
                  title: 'continuebtn'.tr(),
                  fun: () {
                    Navigator.pushNamed(context, '/NameofReservation');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
