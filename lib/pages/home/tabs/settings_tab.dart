import 'package:flutter/material.dart';
import 'package:islami_app/islami_app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: theme.textTheme.bodyLarge,
          ),
          Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                  color: MyThemeData.primaryColor,
                ),
                borderRadius: BorderRadius.circular(25)),
            child: Text(
              AppLocalizations.of(context)!.arabic,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: theme.textTheme.bodyLarge,
          ),
          Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                  color: MyThemeData.primaryColor,
                ),
                borderRadius: BorderRadius.circular(25)),
            child: Text(
              AppLocalizations.of(context)!.light,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
