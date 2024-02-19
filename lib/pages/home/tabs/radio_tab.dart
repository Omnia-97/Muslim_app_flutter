import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<MyProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: 412,
          height: 222,
          image: AssetImage('assets/images/screens_img/radio_screen.png'),
        ),
        SizedBox(
          height: 45,
        ),
        Text(
          AppLocalizations.of(context)!.quranRadio,
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 45,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: AssetImage(
                provider.changeNextIc(),
              ),
              width: 13.5,
              height: 23.14,
            ),
            Icon(
              Icons.play_arrow_rounded,
              size: 60,
              color: provider.changeContainerColor(),
            ),
            Image(
              image: AssetImage(
                provider.changeBackIc(),
              ),
              width: 13.5,
              height: 23.14,
            ),
          ],
        ),
      ],
    );
  }
}
