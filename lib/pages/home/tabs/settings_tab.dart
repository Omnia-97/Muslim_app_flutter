import 'package:flutter/material.dart';
import 'package:islami_app/bottom_sheet/language_bottom_sheet.dart';
import 'package:islami_app/bottom_sheet/theme_bottom_sheet.dart';
import 'package:islami_app/islami_app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var provider = Provider.of<MyProvider>(context);
    var appLocalizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appLocalizations.language,
            style: theme.bodyLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return const SizedBox(
                      height: 580,
                      child: LanguageBottomSheet(),
                    );
                  });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: MyThemeData.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                provider.languageCode == 'en'
                    ? appLocalizations.english
                    : appLocalizations.arabic,
                style: theme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            appLocalizations.theme,
            style: theme.bodyLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return const SizedBox(
                      height: 460,
                      child: ThemeBottomSheet(),
                    );
                  });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: MyThemeData.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                provider.themeMode == ThemeMode.light
                    ? appLocalizations.light
                    : appLocalizations.dark,
                style: theme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
