import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/islami_app_theme.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    String language = provider.languageCode;
    var appLocalization =AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 24),
      child: Column(
        children: [
          RadioListTile(
            activeColor: MyThemeData.primaryColor,
            title: Text(
              appLocalization.english,
              style: GoogleFonts.elMessiri(
                fontSize: 30,
                color: language == 'en'
                    ? MyThemeData.primaryColor
                    : MyThemeData.blackColor,
              ),
            ),
            value: 'en',
            groupValue: language,
            onChanged: (val) {
              language = val!;
              provider.changeLanguage('en');
            },
          ),
          RadioListTile(
              activeColor: MyThemeData.primaryColor,
              selectedTileColor: MyThemeData.primaryColor,
              title: Text(
                appLocalization.arabic,
                style: GoogleFonts.elMessiri(
                  fontSize: 30,
                  color: language == 'ar'
                      ? MyThemeData.primaryColor
                      : MyThemeData.blackColor,
                ),
              ),
              value: 'ar',
              groupValue: language,
              onChanged: (val) {
                language = val!;
                provider.changeLanguage('ar');
              }),
        ],
      ),
    );
  }
}
