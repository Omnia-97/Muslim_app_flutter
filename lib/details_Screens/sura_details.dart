import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/islami_app_theme.dart';
import 'package:islami_app/model/sura_model.dart';

class SuraDetails extends StatefulWidget {
  SuraDetails({super.key});
  static const String routeName = 'Sura Details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(model.index);
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background_home.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'إسلامى',
          ),
        ),
        body: Center(
          child: SizedBox(
            height: 700,
            width: 400,
            child: Card(
              margin: EdgeInsets.all(25),
              color: MyThemeData.whiteColor.withOpacity(.9),
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
                          Text(
                            'سورة ${model.name}',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 10,),
                          Icon(
                            Icons.play_circle_filled_outlined,
                            size: 35,
                          ),
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
                                verses[index],
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        },
                        itemCount: verses.length,
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
  }

  Future<void> loadFile(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = sura.split('\n');
    verses = lines;
    // print(sura);
    setState(() {});
  }
}
