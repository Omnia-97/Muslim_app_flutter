import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/pages/home/tabs/ahadeth_tab.dart';
import 'package:islami_app/pages/home/tabs/quran_tab.dart';
import 'package:islami_app/pages/home/tabs/radio_tab.dart';
import 'package:islami_app/pages/home/tabs/sebha_tab.dart';
import 'package:islami_app/pages/home/tabs/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(
            'assets/images/background_home.png',
          ),
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              AppLocalizations.of(context)!.appName,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            selectedFontSize: 12.0,
            iconSize: 33,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/ic_quran.png'),
                    size: 45,
                  ),
                  label: AppLocalizations.of(context)!.nav_quran),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/ic_ahadeth.png'),
                  ),
                  label: AppLocalizations.of(context)!.nav_ahadeth),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/ic_sebha.png'),
                    size: 45,
                  ),
                  label: AppLocalizations.of(context)!.nav_tasbeh),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/ic_radio.png'),
                    size: 44,
                  ),
                  label: AppLocalizations.of(context)!.nav_radio),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.nav_settings),
            ],
          ),
          body: tabs[index],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
}
