import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:provider/provider.dart';

import '../../Controler/HotelDetailsControl.dart';
import '../../Controler/profilesettingcontrol.dart';
import '../../Controler/searchcontrol.dart';
import '../coustamWidget/Buttoncustam.dart';
import '../coustamWidget/textcustam.dart';

class ReviewHotals extends StatelessWidget {
  const ReviewHotals({super.key});
  @override
  Widget build(BuildContext context) {
    final controlProviders =
        Provider.of<SearchProvider>(context, listen: false);
    final controler = Provider.of<GalleryViewPhotos>(context, listen: false);

    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Textcustam(
                    text: 'Review',
                    size: 24,
                    weight: FontWeight.w700,
                  ),
                  IconButton(
                      onPressed: () {
                        funbottomsheet(context);
                      },
                      icon: Icon(Icons.confirmation_num_outlined))
                ],
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              Container(
                  height: media.height * 0.04,
                  child: Consumer<GalleryViewPhotos>(
                    builder: (context, value, child) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        bool select = index == controler.itemselect3;

                        return InkWell(
                          onTap: () {
                            controler.funslect3(index);
                          },
                          child: Container(
                            height: 100,
                            width: 60,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: select ? Colors.green : null,
                              border:
                                  Border.all(width: 2.0, color: Colors.green),
                            ),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: select ? Colors.white : Colors.green,
                                  size: 20,
                                ),
                                Textcustam(
                                  text: '${controler.bottom3[index]}',
                                  size: 16,
                                  weight: FontWeight.w600,
                                  col: select ? Colors.white : Colors.green,
                                ),
                              ],
                            )),
                          ),
                        );
                      },
                      itemCount: controler.bottom3.length,
                    ),
                  )),
              SizedBox(
                height: media.height * 0.02,
              ),
              Expanded(
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
                            leading:
                                Image.asset(controler.reviews[index].image),
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
                                    text: "${controler.reviews[index].ratings}",
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child:
                                Textcustam(text: controler.reviews[index].dec),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: controler.reviews.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //

//  Bottom appBar to add  reve

  //

  void funbottomsheet(BuildContext context) {
    final controlProviders =
        Provider.of<SearchProvider>(context, listen: false);
    final media = MediaQuery.of(context).size;
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Textcustam(
                  text: 'Rate the Hotel',
                  size: 24,
                  weight: FontWeight.w700,
                ),
                Divider(
                  height: 30,
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
                                image: AssetImage(controlProviders
                                    .listwo[controlProviders.SelestListtoIndex]
                                    .images),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: 110,
                        width: media.width * 0.550,
                        //  color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Textcustam(
                                  text: controlProviders
                                      .listwo[
                                          controlProviders.SelestListtoIndex]
                                      .title,
                                  size: 19,
                                  weight: FontWeight.w700,
                                ),
                                Textcustam(
                                  text:
                                      '\$${controlProviders.listwo[controlProviders.SelestListtoIndex].price}',
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
                                  text: controlProviders
                                      .listwo[
                                          controlProviders.SelestListtoIndex]
                                      .country
                                      .toString(),
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
                                          .listwo[controlProviders
                                              .SelestListtoIndex]
                                          .rating,
                                      col: Colors.green,
                                    ),
                                    Textcustam(
                                      text:
                                          '( ${controlProviders.listwo[controlProviders.SelestListtoIndex].review} reviews)',
                                      col: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.height * 0.01,
                ),
                Textcustam(
                  text: 'Please give your rating & review',
                  size: 20,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Review.....',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.05,
                ),
                RoundButton(
                  title: 'Rate now',
                  fun: () {},
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                RoundButton(
                  title: 'Later',
                  fun: () {
                    Navigator.pop(context);
                  },
                  col: Colors.blue.shade50,
                  textcolor: Colors.green,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
