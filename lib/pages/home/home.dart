import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/pages/home/tabs/ahadeth_tab.dart';
import 'package:islami_app/pages/home/tabs/quran_tab.dart';
import 'package:islami_app/pages/home/tabs/radio_tab.dart';
import 'package:islami_app/pages/home/tabs/sebha_tab.dart';
import 'package:islami_app/pages/home/tabs/settings_tab.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var appLocalizations = AppLocalizations.of(context)!;
    return Stack(
      children: [
        Image(
          image: AssetImage(
            provider.changeBackGround(),
          ),
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              appLocalizations.appName,
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
                  icon: const ImageIcon(
                    AssetImage('assets/images/ic/ic_quran.png'),
                    size: 45,
                  ),
                  label: appLocalizations.nav_quran),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/ic/ic_ahadeth.png'),
                  ),
                  label: appLocalizations.nav_ahadeth),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/ic/ic_sebha.png'),
                    size: 45,
                  ),
                  label: appLocalizations.nav_tasbeh),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/ic/ic_radio.png'),
                    size: 44,
                  ),
                  label: appLocalizations.nav_radio),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: appLocalizations.nav_settings),
            ],
          ),
          body: tabs[index],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    const AhadethTab(),
    const SebhaTab(),
    RadioTab(),
    const SettingsTab(),
  ];
}
