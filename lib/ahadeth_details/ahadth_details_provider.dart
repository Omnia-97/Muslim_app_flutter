import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/ahadeth_model.dart';

class AhadethDetailsProvider extends ChangeNotifier {
  List<HadethModel> ahadethFileData = [];
  void loadAhadethFile() {
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
        notifyListeners();
      },
    );
  }
}
