import 'package:flutter/material.dart';
import 'package:islami_app/islami_app_theme.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode themeMode=  ThemeMode.light;
  void changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }
  void changeThemeMode (ThemeMode mode){
    themeMode =mode;
    notifyListeners();
  }
  String changeSplashScreen(){
    if(themeMode ==ThemeMode.light){
      return "assets/images/Splash.png" ;
    }
    else{
      return "assets/images/splash_dark_mode.png";
    }
  }
  String changeBackGround(){
    if(themeMode ==ThemeMode.light){
      return "assets/images/background_home.png" ;
    }
    else{
      return "assets/images/bg_dark.png";
    }
  }
  Color changeContainerColor(){
    if(themeMode ==ThemeMode.light){
      return MyThemeData.primaryColor ;
    }
    else{
      return MyThemeData.amberColor;
    }
  }
  Color changeCardColor(){
    if(themeMode ==ThemeMode.light){
      return MyThemeData.whiteColor.withOpacity(.9) ;
    }
    else{
      return MyThemeData.primaryDarkColor.withOpacity(.9);
    }
  }
  Color changeQuranTextColor(){
    if(themeMode ==ThemeMode.light){
      return MyThemeData.blackColor ;
    }
    else{
      return MyThemeData.amberColor;
    }
  }
  String changeSeb7aImage(){
    if(themeMode ==ThemeMode.light){
      return "assets/images/sebha_screen.png" ;
    }
    else{
      return "assets/images/sebha_darkMode.png";
    }
  }
  Color changeCounterContainerColor(){
    if(themeMode ==ThemeMode.light){
      return MyThemeData.primaryColor.withOpacity(.57) ;
    }
    else{
      return MyThemeData.primaryDarkColor.withOpacity(.8);
    }
  }
  String changeBackIc(){
    if(themeMode ==ThemeMode.light){
      return "assets/images/Ic_metro-back.png" ;
    }
    else{
      return "assets/images/Icon metro-back_dark.png";
    }
  }
  String changeNextIc(){
    if(themeMode ==ThemeMode.light){
      return "assets/images/Ic_metro-next.png" ;
    }
    else{
      return "assets/images/Icon metro-next_dark.png";
    }
  }

}
