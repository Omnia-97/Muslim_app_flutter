import 'package:flutter/material.dart';
import 'package:islami_app/islami_app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode themeMode = ThemeMode.system;
  SharedPreferences? sharedPreferences;

  Future<void> setItems()async{
     sharedPreferences = await SharedPreferences.getInstance();
     if(getTheme() ?? false){
       themeMode = ThemeMode.dark;
     }else{
       themeMode= ThemeMode.light;
     }
     if(getLang() ?? false){
       languageCode = 'ar';
     }else{
       languageCode = 'en';
     }

  }
  void changeLanguage(String langCode) {
    if(langCode == languageCode){
      return;
    }
    languageCode = langCode;
    if(languageCode == 'ar'){
      saveLang(true);
    }
    else{
      saveLang(false);
    }
    notifyListeners();
  }

  void changeThemeMode(ThemeMode mode) {
    if(mode == themeMode){
      return;
    }
    themeMode = mode;
    if(themeMode == ThemeMode.dark){
      saveTheme(true);
    }else{
      saveTheme(false);
    }
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
  Future<void> saveTheme(bool isDark)async{
   await sharedPreferences!.setBool('isDark', isDark);

  }
  Future<void> saveLang(bool isArabic)async{
    await sharedPreferences!.setBool('isArabic', isArabic);
  }
  bool? getTheme(){
    return sharedPreferences!.getBool('isDark');
  }
  bool? getLang(){
    return sharedPreferences!.getBool('isArabic');
  }

}
