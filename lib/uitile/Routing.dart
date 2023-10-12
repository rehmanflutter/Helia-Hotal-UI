import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Viewe/Forgot & Reset Password/createPassword.dart';
import '../Viewe/Forgot & Reset Password/forgetpassword.dart';
import '../Viewe/Forgot & Reset Password/otp.dart';
import '../Viewe/Home & Action Menu/booking.dart';
import '../Viewe/Home & Action Menu/homepage.dart';
import '../Viewe/Home & Action Menu/likeitem.dart';
import '../Viewe/Home & Action Menu/notification.dart';
import '../Viewe/Hotel Details & Booking/addcardpayment.dart';
import '../Viewe/Hotel Details & Booking/confirmbookingPayment.dart';
import '../Viewe/Hotel Details & Booking/detailfulpage.dart';
import '../Viewe/Hotel Details & Booking/galleryhotelphotos.dart';
import '../Viewe/Hotel Details & Booking/hotellocation.dart';
import '../Viewe/Hotel Details & Booking/namereservation.dart';
import '../Viewe/Hotel Details & Booking/newcard.dart';
import '../Viewe/Hotel Details & Booking/paymentpay.dart';
import '../Viewe/Hotel Details & Booking/reviewhotal.dart';
import '../Viewe/Hotel Details & Booking/selectdate.dart';
import '../Viewe/Hotel Details & Booking/ticketview.dart';
import '../Viewe/Let’s in (Sign up, Sign in, Account Setup)/Lestyouin.dart';
import '../Viewe/Let’s in (Sign up, Sign in, Account Setup)/fillProfile.dart';
import '../Viewe/Let’s in (Sign up, Sign in, Account Setup)/signupbank.dart';
import '../Viewe/Let’s in (Sign up, Sign in, Account Setup)/sininLogin.dart';
import '../Viewe/LightCarousel1V1.dart';
import '../Viewe/LightSplach1.dart';
import '../Viewe/LightWelcome.dart';
import '../Viewe/My Hotel Booking/payment.dart';
import '../Viewe/Profile & Settings/Theem.dart';
import '../Viewe/Profile & Settings/help.dart';
import '../Viewe/Profile & Settings/notificationse.dart';
import '../Viewe/Profile & Settings/profileset.dart';
import '../Viewe/Profile & Settings/security.dart';
import '../Viewe/Search & Filter/applyfilter.dart';
import '../Viewe/Search & Filter/searchfile.dart';
import '../Viewe/Search & Filter/searchhotal.dart';
import '../Viewe/consol2Light.dart';
import '../Viewe/splach2.dart';
import '../Viewe/splishWelcom.dart';
import 'bottomappbar.dart';

class Rout {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/LightSplishV1':
        return MaterialPageRoute(
          builder: (context) => LightSplishV1(),
        );
      case '/LightWelcomV1':
        return MaterialPageRoute(
          builder: (context) => LightWelcomV1(),
        );
      case '/LightCarousel':
        return MaterialPageRoute(
          builder: (context) => LightCarouselV1(),
        );
      case '/Splish2':
        return MaterialPageRoute(
          builder: (context) => Splish2(),
        );
      case '/SplishWelcom2':
        return MaterialPageRoute(
          builder: (context) => SplishWelcom2(),
        );
      case '/Consol2Light':
        return MaterialPageRoute(
          builder: (context) => Consol2Light(),
        );
      case '/LestYouIn':
        return MaterialPageRoute(
          builder: (context) => LestYouIn(),
        );
      case '/SignUpBank':
        return MaterialPageRoute(
          builder: (context) => SignUpBank(),
        );
      case '/FillYourProfile':
        return MaterialPageRoute(
          builder: (context) => FillYourProfile(),
        );

      case '/SignLogin':
        return MaterialPageRoute(
          builder: (context) => SignLogin(),
        );

      case '/ForgotPassword':
        return MaterialPageRoute(
          builder: (context) => ForgotPassword(),
        );

      case '/OTP':
        return MaterialPageRoute(
          builder: (context) => OTP(
            data: settings.arguments as String,
          ),
        );

      case '/CreateNewPassword':
        return MaterialPageRoute(
          builder: (context) => CreateNewPassword(),
        );

      case '/BottomBarCus':
        return MaterialPageRoute(
          builder: (context) => BottomBarCus(),
        );
      case '/Likes':
        return MaterialPageRoute(
          builder: (context) => Likes(),
        );
      case '/HomePage':
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );

      case '/Bookeds':
        return MaterialPageRoute(
          builder: (context) => Bookeds(),
        );
      case '/Notificationss':
        return MaterialPageRoute(
          builder: (context) => Notificationss(),
        );

      case '/SearchFiles':
        return MaterialPageRoute(
          builder: (context) => SearchFiles(),
        );
      case '/FilterHotelOn':
        return MaterialPageRoute(
          builder: (context) => FilterHotelOn(),
        );
      case '/SearchHotal':
        return MaterialPageRoute(
          builder: (context) => SearchHotal(),
        );
      case '/DetailsHotel':
        return MaterialPageRoute(
          builder: (context) => DetailsHotel(
              //   data: settings.arguments as Map,
              ),
        );

      case '/GalleryHotelPhotos':
        return MaterialPageRoute(
          builder: (context) => GalleryHotelPhotos(),
        );

      case '/HotelLocation':
        return MaterialPageRoute(
          builder: (context) => HotelLocation(),
        );

      case '/ReviewHotals':
        return MaterialPageRoute(
          builder: (context) => ReviewHotals(),
        );

      case '/SelectDate':
        return MaterialPageRoute(
          builder: (context) => SelectDate(),
        );

      case '/NameofReservation':
        return MaterialPageRoute(
          builder: (context) => NameofReservation(),
        );

      case '/PaymentPaychose':
        return MaterialPageRoute(
          builder: (context) => PaymentPaychose(),
        );

      case '/NewPamentCard':
        return MaterialPageRoute(
          builder: (context) => NewPamentCard(),
        );

      case '/NewCard':
        return MaterialPageRoute(
          builder: (context) => NewCard(),
        );

      case '/BookingConfirmPayment':
        return MaterialPageRoute(
          builder: (context) => BookingConfirmPayment(),
        );

      case '/CancelHotelBookingpayment':
        return MaterialPageRoute(
          builder: (context) => CancelHotelBookingpayment(),
        );
      case '/TicketView':
        return MaterialPageRoute(
          builder: (context) => TicketView(),
        );
      case '/ProfilesetSetting':
        return MaterialPageRoute(
          builder: (context) => ProfilesetSetting(),
        );
      case '/NotificationSetting':
        return MaterialPageRoute(
          builder: (context) => NotificationSetting(),
        );
      case '/Security':
        return MaterialPageRoute(
          builder: (context) => Security(),
        );
      case '/ThemDark':
        return MaterialPageRoute(
          builder: (context) => ThemDark(),
        );
      case '/Help':
        return MaterialPageRoute(
          builder: (context) => Help(),
        );

      default:
        return null;
    }
  }
}
