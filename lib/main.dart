import 'package:flutter/material.dart';
import 'package:islami_app/pages/home/home.dart';
import 'package:islami_app/pages/splash_Screen.dart';
import 'package:islami_app/details_Screens/sura_details.dart';

import 'details_Screens/hadeth_details.dart';
import 'islami_app_theme.dart';

void main() {
  runApp(
    IslamiApp(),
  );
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        SplashScreen.routeName : (context) => SplashScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        SuraDetails.routeName : (context) => SuraDetails(),
        HadethDetails.routeName : (context) =>  HadethDetails(),
      },
      initialRoute: SplashScreen.routeName ,
    );
  }
}
