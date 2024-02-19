import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/islami_app_theme.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/sura_details/sura_details_provider.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatelessWidget {
  SuraDetails({super.key});
  static const String routeName = 'Sura Details';

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;
    var provider2 = Provider.of<MyProvider>(context);
    bool isTextDirectionRTL = Directionality.of(context) == TextDirection.rtl;
    return ChangeNotifierProvider<SuraDetailsProvider>(
      create: (context) => SuraDetailsProvider()..loadFile(model.index),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  provider2.changeBackGround(),
                ),
                fit: BoxFit.fill),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.appName,
              ),
            ),
            body: Center(
              child: SizedBox(
                height: 700,
                width: 400,
                child: Card(
                  margin: EdgeInsets.all(25),
                  color: provider2.changeCardColor(),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             if( isTextDirectionRTL)...[
                               Icon(
                                 Icons.play_circle_filled_outlined,
                                 size: 35,
                                 color: provider2.changeQuranTextColor(),
                               ),
                               SizedBox(
                                 width: 10,
                               ),
                               Text(
                                 'سورة ${model.name}',
                                 style: GoogleFonts.elMessiri(
                                   textStyle:
                                   Theme.of(context).textTheme.bodyLarge,
                                   color: provider2.changeQuranTextColor(),
                                 ),
                                 textAlign: TextAlign.center,
                               ),
                             ],
                              if(!isTextDirectionRTL)...[
                                Text(
                                  'سورة ${model.name}',
                                  style: GoogleFonts.elMessiri(
                                    textStyle:
                                    Theme.of(context).textTheme.bodyLarge,
                                    color: provider2.changeQuranTextColor(),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.play_circle_filled_outlined,
                                  size: 35,
                                  color: provider2.changeQuranTextColor(),
                                ),
                              ]


                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          indent: 18,
                          endIndent: 18,
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: 12,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Text(
                                    provider.verses[index],
                                    style: GoogleFonts.inter(
                                      textStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      color: provider2.changeQuranTextColor(),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              );
                            },
                            itemCount: provider.verses.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
