import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controler/homecontrolstart.dart';
import '../../Controler/profilesettingcontrol.dart';
import '../../Controler/searchcontrol.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchFiles extends StatelessWidget {
  const SearchFiles({super.key});

  @override
  Widget build(BuildContext context) {
    final controlProviders =
        Provider.of<SearchProvider>(context, listen: false);
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: media.height * 0.06,
            ),
            Container(
              height: 56,
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
                  )),
            ),

            SizedBox(
              height: media.height * 0.02,
            ),
            //  Hotal select All and popular  list

            Container(
                height: media.height * 0.04,
                child: Consumer<SearchProvider>(
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
                            border: Border.all(width: 2.0, color: Colors.green),
                          ),
                          child: Center(
                              child: Textcustam(
                            text: '${controlProviders.firstlist1[index]}'.tr(),
                            col: select ? Colors.white : Colors.green,
                          )),
                        ),
                      );
                    },
                    itemCount: controlProviders.firstlist1.length,
                  ),
                )),
            SizedBox(
              height: media.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textcustam(
                  text: 'rec'.tr(),
                  size: 18,
                  weight: FontWeight.w700,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        funbootemsheet(context);
                      },
                      icon: Icon(
                        Icons.document_scanner,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.04,
                    ),
                    Icon(Icons.window_outlined)
                  ],
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    margin: EdgeInsets.only(bottom: 20),
                    //   color: Colors.red,
                    child: Row(
                      children: [
                        Consumer<SearchProvider>(
                            builder: (context, value, child) => InkWell(
                                  onTap: () {
                                    value.SelestListtoIndex = index;

                                    Navigator.pushNamed(
                                      context,
                                      '/DetailsHotel',
                                    );
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(controlProviders
                                                .listwo[index].images),
                                            fit: BoxFit.cover)),
                                  ),
                                )),
                        Container(
                          height: 110,
                          width: media.width * 0.6,
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
                                    text:
                                        '${controlProviders.listwo[index].title}'
                                            .tr(),
                                    size: 19,
                                    weight: FontWeight.w700,
                                  ),
                                  Textcustam(
                                    text:
                                        '\$${controlProviders.listwo[index].price}',
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
                                    text: controlProviders.listwo[index].country
                                        .toString(),
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
                                            .listwo[index].rating,
                                        col: Colors.green,
                                      ),
                                      Row(
                                        children: [
                                          Textcustam(
                                            text:
                                                ' ${controlProviders.listwo[index].review}   ',
                                            col: Colors.grey,
                                          ),
                                          Text('revie').tr()
                                        ],
                                      ),
                                    ],
                                  ),
                                  Consumer<SearchProvider>(
                                      builder: (context, value, child) =>
                                          IconButton(
                                              onPressed: () {
                                                if (controlProviders.likes
                                                    .contains(index)) {
                                                  controlProviders
                                                      .dislikevedios(index);
                                                } else {
                                                  controlProviders
                                                      .likevedios(index);
                                                }
                                              },
                                              icon: Icon(
                                                controlProviders.likes
                                                        .contains(index)
                                                    ? Icons.bookmark
                                                    : Icons
                                                        .bookmark_border_outlined,
                                                color: Colors.green,
                                              )))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: controlProviders.listwo.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

//

  //  Bottom sheet funcation

//

  void funbootemsheet(BuildContext context) async {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          final controlerclass =
              Provider.of<BottomsheetinSearch>(context, listen: false);
          final media = MediaQuery.of(context).size;
          return SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: media.height * 0.01,
                      ),
                      Center(
                        child: Textcustam(
                          text: 'Filter Hotel',
                          size: 24,
                          weight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textcustam(
                            text: 'Country',
                            size: 18,
                            weight: FontWeight.w700,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Textcustam(text: 'See All'))
                        ],
                      ),
                      Container(
                          height: media.height * 0.04,
                          child: Consumer<BottomsheetinSearch>(
                            builder: (context, value, child) =>
                                ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                bool select =
                                    index == controlerclass.itemselect1;

                                return InkWell(
                                  onTap: () {
                                    controlerclass.funslect1(index);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: select ? Colors.green : null,
                                      border: Border.all(
                                          width: 2.0, color: Colors.green),
                                    ),
                                    child: Center(
                                        child: Textcustam(
                                      text: '${controlerclass.bottom1[index]}',
                                      col: select ? Colors.white : Colors.green,
                                    )),
                                  ),
                                );
                              },
                              itemCount: controlerclass.bottom1.length,
                            ),
                          )),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      Textcustam(
                        text: 'Sort Results',
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      Container(
                          height: media.height * 0.04,
                          child: Consumer<BottomsheetinSearch>(
                            builder: (context, value, child) =>
                                ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                bool select =
                                    index == controlerclass.itemselect2;

                                return InkWell(
                                  onTap: () {
                                    controlerclass.funslect2(index);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: select ? Colors.green : null,
                                      border: Border.all(
                                          width: 2.0, color: Colors.green),
                                    ),
                                    child: Center(
                                        child: Textcustam(
                                      text: '${controlerclass.bottom2[index]}',
                                      col: select ? Colors.white : Colors.green,
                                    )),
                                  ),
                                );
                              },
                              itemCount: controlerclass.bottom2.length,
                            ),
                          )),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      Textcustam(
                        text: 'Price Range Per Night',
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      RangeSlider(
                        values: RangeValues(
                            0.0, 100.0), // Initial values for the range
                        min: 0.0, // Minimum value
                        max: 200.0, // Maximum value
                        onChanged: (RangeValues values) {
                          // Handle the range change here
                          print(
                              "Selected range: ${values.start} - ${values.end}");
                        },
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      Textcustam(
                        text: 'Star Rating',
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      Container(
                          height: media.height * 0.04,
                          child: Consumer<BottomsheetinSearch>(
                            builder: (context, value, child) =>
                                ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                bool select =
                                    index == controlerclass.itemselect3;

                                return InkWell(
                                  onTap: () {
                                    controlerclass.funslect3(index);
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 60,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: select ? Colors.green : null,
                                      border: Border.all(
                                          width: 2.0, color: Colors.green),
                                    ),
                                    child: Center(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: select
                                              ? Colors.white
                                              : Colors.green,
                                        ),
                                        Textcustam(
                                          text:
                                              '   ${controlerclass.bottom3[index]}',
                                          col: select
                                              ? Colors.white
                                              : Colors.green,
                                        ),
                                      ],
                                    )),
                                  ),
                                );
                              },
                              itemCount: controlerclass.bottom3.length,
                            ),
                          )),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textcustam(
                            text: 'Facilities',
                            size: 18,
                            weight: FontWeight.w700,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Textcustam(text: 'See All'))
                        ],
                      ),

                      Container(
                          height: media.height * 0.07,
                          //color: Colors.amber,
                          child: Consumer<BottomsheetinSearch>(
                            builder: (context, value, child) =>
                                ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.items.length,
                              itemBuilder: (context, index) {
                                final item = value.items[index];
                                return Row(
                                  children: [
                                    Checkbox(
                                      value: item.isSelected,
                                      onChanged: (newValue) {
                                        value.boxvalue(newValue!);
                                        value.toggleItemSelection(index);
                                      },
                                    ),
                                    Text(value.items[index].label),
                                  ],
                                );
                              },
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textcustam(
                            text: 'Accommodation Type',
                            size: 18,
                            weight: FontWeight.w700,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Textcustam(text: 'See All'))
                        ],
                      ),
                      // SizedBox(
                      //   height: media.height * 0.0,
                      // ),
                      Container(
                          height: media.height * 0.07,
                          //color: Colors.amber,
                          child: Consumer<BottomsheetinSearch>(
                            builder: (context, value, child) =>
                                ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.itemsAccommodation.length,
                              itemBuilder: (context, index) {
                                final item = value.itemsAccommodation[index];
                                return Row(
                                  children: [
                                    Checkbox(
                                      value: item.isSelected,
                                      onChanged: (newValue) {
                                        value.boxvalueAccommodation(newValue!);
                                        value.toggleItemSelectionAccommodation(
                                            index);
                                      },
                                    ),
                                    Text(value.itemsAccommodation[index].label),
                                  ],
                                );
                              },
                            ),
                          )),
                      Divider(
                        height: 20,
                      ),
                      Row(children: [
                        Expanded(
                          child: RoundButton(
                            title: 'Reset',
                            fun: () {
                              Navigator.pop(context);
                            },
                            col: Colors.blue.shade50,
                            textcolor: Colors.green,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: RoundButton(
                            title: 'Apply Filter',
                            fun: () {
                              Navigator.pushNamed(context, '/FilterHotelOn');
                            },
                          ),
                        )
                      ]),
                    ])),
          );
        });
  }
}
