import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/islami_app_theme.dart';
import 'package:islami_app/pages/home/tabs/ahadeth_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../model/ahadeth_model.dart';
import '../providers/my_provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'Hadeth Details';
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var provider2 =Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)!.settings.arguments as HadethModel;
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider2.changeBackGround(),),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.appName,
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(25),
            padding: EdgeInsets.all(16),
            width: 400,
            height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: provider2.changeCardColor(),
            ),
            child: Column(
              children: [
                Text(
                  model.title,
                  style: GoogleFonts.elMessiri(
                    textStyle: theme.textTheme.bodyLarge,
                    color: provider2.changeQuranTextColor(),
                  ),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  thickness: 1,
                  indent: 18,
                  endIndent: 18,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                    itemBuilder: (context, index) {
                      return Text(
                        model.content[index],
                        style: GoogleFonts.inter(
                          textStyle: theme.textTheme.bodySmall,
                          color:provider2.changeQuranTextColor(),
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                    itemCount: model.content.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
