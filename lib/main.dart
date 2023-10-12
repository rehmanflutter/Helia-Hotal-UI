import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Controler/HotelDetailsControl.dart';
import 'Controler/bookingcontrol.dart';
import 'Controler/bottomappbarcontrol.dart';
import 'Controler/controler.dart';
import 'Controler/homecontrolstart.dart';
import 'Controler/hotalResevationcontrol.dart';
import 'Controler/hotalbookdatesetticket.dart';
import 'Controler/profilesettingcontrol.dart';
import 'Controler/searchcontrol.dart';
import 'Viewe/LightSplach1.dart';
import 'Viewe/login.dart';
import 'uitile/Routing.dart';
import 'uitile/bottomappbar.dart';

import 'package:easy_localization/easy_localization.dart';

// void main() {
//   runApp(
//     EasyLocalization(
//       supportedLocales: [Locale('en'), Locale('ur')],
//       path: 'images/translator',
//       fallbackLocale: Locale('en'),
//       startLocale: Locale('en'),
//       child: MyApp(),
//     ),
//   );
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  stored language preference
  var pref = await SharedPreferences.getInstance();
  String? storedLanguage = pref.getString('language');

  Locale initialLocale = storedLanguage == 'ur' ? Locale('ur') : Locale('en');

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ur')],
      path: 'images/translator',
      fallbackLocale: Locale('en'),
      startLocale: initialLocale, // Set the initial locale here
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Rout NameRoute = Rout();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CountProvied(),
          ),
          ChangeNotifierProvider(
            create: (context) => Consol2Pageview(),
          ),
          ChangeNotifierProvider(
            create: (context) => SignUpBankPro(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProfileProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => Forgetliststing(),
          ),
          ChangeNotifierProvider(
            create: (context) => CreateYourNewPasswordss(),
          ),
          ChangeNotifierProvider(
            create: (context) => Homecontrol(),
          ),
          ChangeNotifierProvider(
            create: (context) => Towdaylist(),
          ),
          ChangeNotifierProvider(
            create: (context) => SearchProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomsheetinSearch(),
          ),
          ChangeNotifierProvider(
            create: (context) => BookingProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => Profilesettinglist(),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomAppBArCon(),
          ),
          ChangeNotifierProvider(
            create: (context) => GalleryViewPhotos(),
          ),
          ChangeNotifierProvider(
            create: (context) => HotalBookDatesetTicket(),
          ),
          ChangeNotifierProvider(
            create: (context) => Nameresevertion(),
          ),
          // ChangeNotifierProvider(
          //   create: (context) => LocalizationProvider(),
          // )
        ],
        child: Builder(builder: (context) {
          final ThemeModechange = Provider.of<Profilesettinglist>(context);
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,

            themeMode: ThemeModechange.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.green,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.green,
            ),

            onGenerateRoute: NameRoute.onGenerateRoute,
            //home: BottomBarCus(),
            home: LoginScreen(),
            debugShowCheckedModeBanner: false,
          );
        }));
  }
}
