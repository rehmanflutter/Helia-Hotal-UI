import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/consol1Model.dart';

//

// Pageview   1  Provider  befour login

//

class CountProvied with ChangeNotifier {
  List<Pageviewcontrol> pageviewcontrol = [
    Pageviewcontrol(
        image: 'images/pageimage1.png',
        title: 'Travel safely, comfortably, & easily'),
    Pageviewcontrol(
        image: 'images/pageimage2.png',
        title: 'Find the best hotels for your vacation'),
    Pageviewcontrol(
        image: 'images/pageimage3.png',
        title: 'Lets discover the world with us')
  ];
  PageController pageControllers = PageController();
}
//

// Pageview   2 Provider  befour login

//
class Consol2Pageview with ChangeNotifier {
  List<ConsolPageview2> pageview2 = [
    ConsolPageview2(
        image: 'images/Polygon2.png',
        title: 'Let’s discover the world with us'),
    ConsolPageview2(
        image: 'images/Polygon.png',
        title: 'Let’s have the best vacation with us'),
    ConsolPageview2(
        image: 'images/Polygon1.png', title: 'Travel made easy in your hands'),
  ];
  PageController pageControllers = PageController();
}

//

//  SignUp  Provider

//

class SignUpBankPro extends ChangeNotifier {
  bool _checkBoxNotifier = false;
  bool get checkBoxValues => _checkBoxNotifier;

  void boxvalue(bool value) {
    _checkBoxNotifier = value;
    notifyListeners();
  }
}
//

//   Profile  image pic Provider

//

class ProfileProvider with ChangeNotifier {
  File? imagess;

  final picker = ImagePicker();

  Future<void> getimage(ImageSource source) async {
    XFile? picfile = await picker.pickImage(
      source: source,
      imageQuality: 90,
    );

    if (picfile != null) {
      CropImage(picfile);
    }
  }

  Future<void> CropImage(XFile fileData) async {
    CroppedFile? _croppedImage =
        await ImageCropper().cropImage(sourcePath: fileData.path);
    if (_croppedImage != null) {
      imagess = File(_croppedImage.path);
      notifyListeners();
    }
  }
}

//

//   password Forgetliststing   provider

//
class Forgetliststing extends ChangeNotifier {
  List<ForgetpassWordSelect> listchose = [
    ForgetpassWordSelect(
        title: 'via SMS:',
        subtitle: '+1 111 ******99',
        image: 'images/group.png'),
    ForgetpassWordSelect(
        title: 'via Email:',
        subtitle: 'dan***in@yourdomain.com',
        image: 'images/message.png'),
  ];

  int _selectedItemIndex = -1;
  final nametext = TextEditingController();
  final gender = TextEditingController();
  final dateof = TextEditingController();
  final email = TextEditingController();
  final phoneno = TextEditingController();
  final nicname = TextEditingController();
  int get selectedItemIndex => _selectedItemIndex;

  void selectItem(int index) {
    _selectedItemIndex = index;
    notifyListeners();
  }
}

//

//  CreateYourNewPasswordss   to forget password

class CreateYourNewPasswordss extends ChangeNotifier {
  bool _check = false;
  bool get checkButtons => _check;

  void checfun(bool value) {
    _check = value;
    notifyListeners();
  }
}
