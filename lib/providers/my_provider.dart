import 'package:flutter/material.dart';
import 'package:islami_app/islami_app_theme.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode themeMode = ThemeMode.light;
  void changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }

  void changeThemeMode(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  String changeSplashScreen() {
    if (themeMode == ThemeMode.light) {
      return "assets/images/Splash.png";
    } else {
      return "assets/images/dark_mode/splash_dark_mode.png";
    }
  }

  String changeBackGround() {
    if (themeMode == ThemeMode.light) {
      return "assets/images/screens_img/background_home.png";
    } else {
      return "assets/images/dark_mode/bg_dark.png";
    }
  }

  Color changeContainerColor() {
    if (themeMode == ThemeMode.light) {
      return MyThemeData.primaryColor;
    } else {
      return MyThemeData.amberColor;
    }
  }

  Color changeCardColor() {
    if (themeMode == ThemeMode.light) {
      return MyThemeData.whiteColor.withOpacity(.9);
    } else {
      return MyThemeData.primaryDarkColor.withOpacity(.9);
    }
  }

  Color changeQuranTextColor() {
    if (themeMode == ThemeMode.light) {
      return MyThemeData.blackColor;
    } else {
      return MyThemeData.amberColor;
    }
  }

  String changeSeb7aImage() {
    if (themeMode == ThemeMode.light) {
      return "assets/images/screens_img/sebha_screen.png";
    } else {
      return "assets/images/dark_mode/sebha_darkMode.png";
    }
  }

  Color changeCounterContainerColor() {
    if (themeMode == ThemeMode.light) {
      return MyThemeData.primaryColor.withOpacity(.57);
    } else {
      return MyThemeData.primaryDarkColor.withOpacity(.8);
    }
  }



}
