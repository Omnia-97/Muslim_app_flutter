import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/islami_app_theme.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    ThemeMode theme = provider.themeMode;
    var appLocalization = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 24),
      child: Column(
        children: [
          RadioListTile(
            activeColor: MyThemeData.primaryColor,
            title: Text(
              appLocalization.light,
              style: GoogleFonts.elMessiri(
                fontSize: 30,
                color: theme == ThemeMode.light
                    ? MyThemeData.primaryColor
                    : MyThemeData.blackColor,
              ),
            ),
            value: ThemeMode.light,
            groupValue: theme,
            onChanged: (val) {
              theme = val!;
              provider.changeThemeMode(ThemeMode.light);
            },
          ),
          RadioListTile(
              activeColor: MyThemeData.primaryColor,
              title: Text(
                appLocalization.dark,
                style: GoogleFonts.elMessiri(
                  fontSize: 30,
                  color: theme == ThemeMode.dark
                      ? MyThemeData.primaryColor
                      : MyThemeData.blackColor,
                ),
              ),
              value: ThemeMode.dark,
              groupValue: theme,
              onChanged: (val) {
                theme = val!;
                provider.changeThemeMode(ThemeMode.dark);
              }),
        ],
      ),
    );
  }
}
