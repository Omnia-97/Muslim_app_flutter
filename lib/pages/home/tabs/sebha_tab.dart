import 'package:flutter/material.dart';
import 'package:islami_app/islami_app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 1;
  int index = 0;
  List<String> tasbeh = [
    'سبحان اللَّه',
    'الحمد للّه',
    'اللَّه أكبر',
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: sebhaClicked,
          child: Container(
            alignment: Alignment.center,
            child: Image(
              width: 230,
              height: 300,
              image: AssetImage(
                'assets/images/sebha_screen.png',
              ),
            ),
          ),
        ),
        SizedBox(
          height: 45,
        ),
        Text(
          AppLocalizations.of(context)!.numberOfTasbeh,
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          height: 81,
          width: 69,
          decoration: BoxDecoration(
            color: MyThemeData.primaryColor.withOpacity(.57),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '$counter',
            style: theme.textTheme.bodySmall,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          height: 51,
          width: 137,
          decoration: BoxDecoration(
            color: MyThemeData.primaryColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            tasbeh[index],
            style: theme.textTheme.titleSmall,
          ),
        ),
      ],
    );
  }

  void sebhaClicked() {
    counter++;
    if (counter == 31) {
      counter = 1;
      index++;
    }
    if (index == tasbeh.length) {
      index = 0;
    }
    setState(() {});
  }
}
