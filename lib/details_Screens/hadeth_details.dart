import 'package:flutter/material.dart';
import 'package:islami_app/islami_app_theme.dart';
import 'package:islami_app/pages/home/tabs/ahadeth_tab.dart';

import '../model/ahadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'Hadeth Details';
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as HadethModel;
    var theme = Theme.of(context);
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
          child: Container(
            margin: EdgeInsets.all(25),
            padding: EdgeInsets.all(16),
            width: 400,
            height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: MyThemeData.whiteColor.withOpacity(.7),
            ),
            child: Column(
              children: [
                Text(
                  model.title,
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                Divider(
                  thickness: 1,
                  indent: 18,
                  endIndent: 18,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context,index) => SizedBox(
                      height: 5,
                    ),
                    itemBuilder: (context, index) {
                    return Text(
                      model.content[index],
                      style: theme.textTheme.bodySmall,
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
