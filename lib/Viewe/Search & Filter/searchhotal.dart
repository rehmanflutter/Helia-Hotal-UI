import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controler/searchcontrol.dart';
import '../coustamWidget/textcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchHotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controlProviders =
        Provider.of<SearchProvider>(context, listen: false);
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Consumer<SearchProvider>(
                builder: (context, controlProvider, _) {
                  return TextField(
                    controller: controlProvider.searchController,
                    onChanged: (value) {
                      controlProvider.setSearch(value);
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'search'.tr(),
                        border: OutlineInputBorder()),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
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
                              border:
                                  Border.all(width: 2.0, color: Colors.green),
                            ),
                            child: Center(
                                child: Textcustam(
                              text:
                                  '${controlProviders.firstlist1[index]}'.tr(),
                              col: select ? Colors.white : Colors.green,
                            )),
                          ),
                        );
                      },
                      itemCount: controlProviders.firstlist1.length,
                    ),
                  )),
              SizedBox(
                height: media.height * 0.02,
              ),
              Divider(),
              SizedBox(
                height: media.height * 0.02,
              ),
              Textcustam(
                text: 'recent'.tr(),
                size: 18,
                weight: FontWeight.w700,
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              Expanded(
                child: Consumer<SearchProvider>(
                  builder: (context, controlProvider, _) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        String potion = controlProvider.listwo[index].title;
                        if (controlProvider.search.isEmpty ||
                            potion
                                .toLowerCase()
                                .contains(controlProvider.search)) {
                          return ListTile(
                            title: Text(' $potion'),
                            trailing: Icon(Icons.cancel_presentation_outlined),
                            onTap: () {
                              controlProviders.SelestListtoIndex = index;
                              Navigator.pushNamed(
                                context,
                                '/DetailsHotel',
                              );
                            },
                          );
                        }

                        return Container();
                      },
                      itemCount: controlProvider.listwo.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
