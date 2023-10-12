import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controler/HotelDetailsControl.dart';
import '../coustamWidget/textcustam.dart';

class GalleryHotelPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controler = Provider.of<GalleryViewPhotos>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    text: 'Gallery Hotel Photos',
                    size: 24,
                    weight: FontWeight.w700,
                  ),
                  Icon(Icons.confirmation_num_outlined)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 182,
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 130),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
