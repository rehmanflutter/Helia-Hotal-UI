import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controler/homecontrolstart.dart';
import '../../Controler/profilesettingcontrol.dart';
import '../../Controler/searchcontrol.dart';
import '../coustamWidget/textcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class FilterHotelOn extends StatelessWidget {
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
            //  Hotal select All and popular

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
                  text: 'filtered'.tr(),
                  size: 18,
                  weight: FontWeight.w700,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
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
                  return index > 5
                      ? Container(
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
                                                  image: AssetImage(
                                                      controlProviders
                                                          .listwo[index]
                                                          .images),
                                                  fit: BoxFit.cover)),
                                        ),
                                      )),
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
                                          text: controlProviders
                                              .listwo[index].title,
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
                                          text: controlProviders
                                              .listwo[index].country
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
                                            Textcustam(
                                              text:
                                                  '( ${controlProviders.listwo[index].review} reviews)',
                                              col: Colors.grey,
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
                                                            .dislikevedios(
                                                                index);
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
                        )
                      : Container();
                },
                itemCount: controlProviders.listwo.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
