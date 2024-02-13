import 'package:flutter/material.dart';
import 'package:islami_app/pages/home/home.dart';
import 'package:islami_app/pages/splash_Screen.dart';

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
      routes: {
        SplashScreen.routeName : (context) => SplashScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
      },
      initialRoute: SplashScreen.routeName ,
    );
  }
}
