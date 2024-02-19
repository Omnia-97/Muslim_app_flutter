import 'package:flutter/material.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../islami_app_theme.dart';
import '../model/sura_model.dart';
import '../sura_details/sura_details.dart';

class QuranTitleWidget extends StatelessWidget {
  final String suraName;
  final String versesNumber;
  int index;
  QuranTitleWidget(
      {required this.index,
      required this.suraName,
      required this.versesNumber,
      super.key});

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<MyProvider>(context);
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                SuraDetails.routeName,
                arguments: SuraModel(name: suraName, index: index),
              );
            },
            child: Text(
              suraName,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: 1.5,
          height: 38,
          color:provider.changeContainerColor(),
        ),
        Expanded(
          child: Text(
            versesNumber,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),

      ],
    );
  }
}
