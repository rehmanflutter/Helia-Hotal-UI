import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controler/homecontrolstart.dart';
import '../coustamWidget/textcustam.dart';
import 'package:easy_localization/easy_localization.dart';

class Notificationss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerconreo = Provider.of<Towdaylist>(context, listen: false);
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: media.height * 0.048,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      Textcustam(
                        text: 'notification'.tr(),
                        weight: FontWeight.w700,
                        size: 24,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.do_not_disturb_on_total_silence_rounded,
                            color: Colors.green,
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: media.height * 0.03,
              ),
              Textcustam(
                text: 'today'.tr(),
                size: 18,
                weight: FontWeight.w700,
              ),
              Container(
                height: media.height * 0.3,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ListTile(
                        leading: Image.asset(
                          providerconreo.firstlist[index].image,
                        ),
                        title: Textcustam(
                          text: '${providerconreo.firstlist[index].title}'.tr(),
                          size: 18,
                          weight: FontWeight.w700,
                        ),
                        subtitle: Textcustam(
                            text: '${providerconreo.firstlist[index].subtitle}'
                                .tr()),
                      ),
                    );
                  },
                  itemCount: providerconreo.firstlist.length,
                ),
              ),
              Textcustam(
                text: 'yesterday'.tr(),
                size: 18,
                weight: FontWeight.w700,
              ),
              Container(
                height: media.height * 0.3,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ListTile(
                        leading: Image.asset(
                          '${providerconreo.sectlist[index].image}'.tr(),
                        ),
                        title: Textcustam(
                          text: '${providerconreo.sectlist[index].title}'.tr(),
                          size: 18,
                          weight: FontWeight.w700,
                        ),
                        subtitle: Textcustam(
                            text: providerconreo.sectlist[index].subtitle),
                      ),
                    );
                  },
                  itemCount: providerconreo.sectlist.length,
                ),
              ),
              Textcustam(
                text: 'dec'.tr(),
                size: 18,
                weight: FontWeight.w700,
              ),
              Container(
                height: media.height * 0.3,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ListTile(
                        leading: Image.asset(
                          providerconreo.thredlist[index].image,
                        ),
                        title: Textcustam(
                          text: '${providerconreo.thredlist[index].title}'.tr(),
                          size: 18,
                          weight: FontWeight.w700,
                        ),
                        subtitle: Textcustam(
                            text: '${providerconreo.thredlist[index].subtitle}'
                                .tr()),
                      ),
                    );
                  },
                  itemCount: providerconreo.thredlist.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
