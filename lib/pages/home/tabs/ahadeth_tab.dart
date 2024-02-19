import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/ahadeth_details/ahadth_details_provider.dart';
import 'package:islami_app/ahadeth_details/hadeth_details.dart';
import 'package:provider/provider.dart';

class AhadethTab extends StatelessWidget {
  AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<AhadethDetailsProvider>(
      create: (context) => AhadethDetailsProvider()..loadAhadethFile(),
      builder: (context, child) {
        var theme = Theme.of(context);
        var provider = Provider.of<AhadethDetailsProvider>(context);
        return Column(
          children: [
            Image(
              image: AssetImage('assets/images/ahadeth_screen.png'),
              width: 312,
              height: 219,
            ),
            Divider(),
            Text(
              AppLocalizations.of(context)!.ahadeth,
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
                      Navigator.pushNamed(context, HadethDetails.routeName,
                          arguments: provider.ahadethFileData[index]);
                    },
                    child: Text(
                      provider.ahadethFileData[index].title,
                      style: theme.textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                itemCount: provider.ahadethFileData.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
