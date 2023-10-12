import 'package:provider/provider.dart';

import '../Controler/bottomappbarcontrol.dart';
import '../Controler/profilesettingcontrol.dart';
import '../Viewe/Home & Action Menu/homepage.dart';
import '../Viewe/My Hotel Booking/mybookinghotal.dart';
import '../Viewe/Profile & Settings/profilesitting.dart';
import '../Viewe/Search & Filter/searchfile.dart';

import 'package:flutter/material.dart';

class BottomBarCus extends StatelessWidget {
  var classes = [HomePage(), SearchFiles(), MyBooking(), ProfileSettings()];

  @override
  Widget build(BuildContext context) {
    final controler = Provider.of<BottomAppBArCon>(context, listen: true);
    return Scaffold(
      body: classes[controler.index],
      bottomNavigationBar: BottomAppBar(
          child: Container(
              width: 375,
              height: 60,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //     // topLeft: Radius.circular(30),
                //     // topRight: Radius.circular(30)
                //     ),
                color: Themchangecolor.lightmoods == true
                    ? Colors.grey.shade100
                    : Colors.black,
                //     color: Color(0xFFFFFFFF),
              ),
              child: Consumer<BottomAppBArCon>(
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: (() {
                        value.Appbarfun(0);
                      }),
                      icon: Icon(
                        Icons.home,
                        color: value.index == 0 ? Colors.green : Colors.grey,
                      ),
                      tooltip: 'Home',
                    ),
                    IconButton(
                      onPressed: (() {
                        value.Appbarfun(1);
                      }),
                      icon: Icon(
                        Icons.search,
                        color: value.index == 1 ? Colors.green : Colors.grey,
                      ),
                      tooltip: 'search',
                    ),

                    IconButton(
                      onPressed: (() {
                        value.Appbarfun(2);
                      }),
                      icon: Icon(Icons.document_scanner_rounded),
                      color: value.index == 2 ? Colors.green : Colors.grey,
                      tooltip: 'Booking',
                    ),

                    // FloatingActionButton(
                    //   onPressed: () {
                    //     // setState(() {
                    //     //   courentIndet = 2;
                    //     // });
                    //   },
                    //   child: Icon(
                    //     Icons.search,
                    //     size: 40,
                    //   ),
                    //   backgroundColor: Color.fromARGB(255, 2, 46, 87),
                    // ),

                    IconButton(
                      onPressed: (() {
                        value.Appbarfun(3);
                      }),
                      icon: Icon(Icons.person),
                      color: value.index == 3 ? Colors.green : Colors.grey,
                      tooltip: 'Profile',
                    ),
                  ],
                ),
              ))),
    );
  }
}
