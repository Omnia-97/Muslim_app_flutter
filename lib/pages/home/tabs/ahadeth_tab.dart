import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/details_Screens/hadeth_details.dart';
import 'package:islami_app/model/ahadeth_model.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> ahadethFileData = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (ahadethFileData.isEmpty) {
      loadAhadethFile();
    }

    return Column(
      children: [
        Image(
          image: AssetImage('assets/images/ahadeth_screen.png'),
          width: 312,
          height: 219,
        ),
        Divider(),
        Text(
          'الأحاديث',
          style: theme.textTheme.bodyMedium,
        ),
        Divider(),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              indent: 50,
              endIndent: 50,
              thickness: 1,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    HadethDetails.routeName,
                    arguments: ahadethFileData[index]
                  );
                },
                child: Text(
                  ahadethFileData[index].title,
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              );
            },
            itemCount: ahadethFileData.length,
          ),
        ),
      ],
    );
  }

  loadAhadethFile() {
    rootBundle.loadString('assets/files/ahadeth.txt').then(
      (ahadethFile) {
        List<String> ahadeth = ahadethFile.split('#');
        for (int i = 0; i < ahadeth.length; i++) {
          String hadeth = ahadeth[i];
          List<String> hadethLines = hadeth.trim().split('\n');
          String title = hadethLines[0];
          hadethLines.removeAt(0);
          List<String> hadethContent = hadethLines;
          ahadethFileData.add(
            HadethModel(
              title: title,
              content: hadethContent,
            ),
          );
        }
        setState(() {});
      },
    );
  }
}
