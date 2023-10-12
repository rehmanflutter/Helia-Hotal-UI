import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../Controler/HotelDetailsControl.dart';
import '../../Controler/profilesettingcontrol.dart';
import '../../Controler/searchcontrol.dart';
import 'package:easy_localization/easy_localization.dart';

import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';

class DetailsHotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final searchcontr = Provider.of<SearchProvider>(context, listen: false);

    final controlProviders =
        Provider.of<SearchProvider>(context, listen: false);
    final controler = Provider.of<GalleryViewPhotos>(context, listen: false);
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/imageroom.png'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Textcustam(
                      // text: 'I Dont Now',

                      text:
                          ' ${controlProviders.listwo[controlProviders.SelestListtoIndex].title}',
                      size: 30,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: Colors.green,
                        ),
                        Container(
                          width: media.width * 0.7,
                          child: Textcustam(
                              align: TextAlign.center,
                              text:
                                  '79 Place de la Madeleine, Paris, 75009 ${controlProviders.listwo[controlProviders.SelestListtoIndex].country}'),
                        )
                      ],
                    ),
                    Divider(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Textcustam(
                          text: 'gallere'.tr(),
                          size: 20,
                          weight: FontWeight.w700,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/GalleryHotelPhotos');
                            },
                            child: Textcustam(
                              text: 'seeall'.tr(),
                              size: 17,
                              weight: FontWeight.w700,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: media.height * 0.01,
                    ),
                    Container(
                      height: 100,
                      // color: Color.fromARGB(255, 222, 193, 106),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            width: 140,
                            margin: EdgeInsets.only(
                                right: 10), // Add margin between images
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(controler.viewimages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        itemCount: controler.viewimages.length,
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Textcustam(
                      text: 'details'.tr(),
                      size: 20,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: media.height * 0.01,
                    ),
                    Container(
                      height: 70,
                      // color: Colors.amber,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                      controler.detailss[index].image,
                                      height: 20,
                                    )),
                                Textcustam(
                                    text: '${controler.detailss[index].name}'
                                        .tr()),
                              ],
                            ),
                          );
                        },
                        itemCount: controler.detailss.length,
                      ),
                    ),
                    Textcustam(
                      text: 'description'.tr(),
                      size: 20,
                      weight: FontWeight.w700,
                    ),
                    ReadMoreText(
                      'readtext'.tr(),
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read more',
                      trimExpandedText: 'Show less',
                      moreStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Textcustam(
                      text: 'facilites'.tr(),
                      size: 20,
                      weight: FontWeight.w700,
                    ),
                    Container(
                      height: media.height * 0.290,
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 54,
                            width: 89,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 32,
                                    width: 32,
                                    child: Image.asset(
                                      controler.FacilitesHotal[index].image,
                                      height: 20,
                                    )),
                                Textcustam(
                                    align: TextAlign.center,
                                    text:
                                        "${controler.FacilitesHotal[index].name}"
                                            .tr()),
                              ],
                            ),
                          );
                        },
                        itemCount: controler.FacilitesHotal.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 70),
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.01,
                    ),
                    Textcustam(
                      text: 'location'.tr(),
                      size: 20,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/HotelLocation');
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage('images/map.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                              left: 10,
                              bottom: 10,
                              top: 10,
                              right: 10,
                              child: Icon(
                                Icons.location_on,
                                color: Colors.green,
                                size: 40,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Textcustam(
                              text: 'review'.tr(),
                              size: 20,
                              weight: FontWeight.w700,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Textcustam(
                              text:
                                  ' ${controlProviders.listwo[controlProviders.SelestListtoIndex].rating}',

                              // text: '4.8',
                              col: Colors.green,
                            )
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/ReviewHotals');
                            },
                            child: Textcustam(
                              text: 'seeall'.tr(),
                              weight: FontWeight.w700,
                            ))
                      ],
                    ),
                    Container(
                      height: media.height * 0.950,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 148,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Themchangecolor.lightmoods == true
                                  ? Colors.grey.shade100
                                  : Colors.black,
                            ),
                            margin: EdgeInsets.only(bottom: 15),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                      controler.reviews[index].image),
                                  title: Textcustam(
                                      text: controler.reviews[index].name,
                                      weight: FontWeight.w700),
                                  subtitle: Textcustam(
                                    text: 'Dec 09, 2024',
                                    size: 12,
                                  ),
                                  trailing: Container(
                                    height: 32,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.green),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.star_outlined,
                                          color: Colors.white,
                                        ),
                                        Textcustam(
                                          text:
                                              "${controler.reviews[index].ratings}",
                                          col: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: media.height * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Textcustam(
                                      text: controler.reviews[index].dec),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: controler.reviews.length,
                      ),
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    RoundButton(
                      title: 'More',
                      textcolor: Colors.green,
                      col: Colors.blue.shade50,
                      fun: () {},
                    ),
                    SizedBox(
                      height: media.height * 0.04,
                    ),
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Textcustam(
                              text:
                                  '\$ ${controlProviders.listwo[controlProviders.SelestListtoIndex].price}',
                              size: 30,
                              weight: FontWeight.w700,
                              col: Colors.green,
                            ),
                            Textcustam(text: 'pernight'.tr()),
                            Expanded(
                              child: RoundButton(
                                title: 'booknow'.tr(),
                                fun: () {
                                  Navigator.pushNamed(context, '/SelectDate');
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
