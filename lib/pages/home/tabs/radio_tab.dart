import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/islami_app_theme.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<MyProvider>(context);
    Color iconColor = theme.brightness == Brightness.light
        ? MyThemeData.primaryColor
        : MyThemeData.amberColor;
    bool isTextDirectionRTL = Directionality.of(context) == TextDirection.rtl;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          width: 412,
          height: 222,
          image: AssetImage('assets/images/screens_img/radio_screen.png'),
        ),
        const SizedBox(
          height: 45,
        ),
        Text(
          AppLocalizations.of(context)!.quranRadio,
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 45,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: AssetImage(
                isTextDirectionRTL
                    ? 'assets/images/ic/Ic_metro-next.png'
                    : 'assets/images/ic/Ic_metro-back.png',
              ),
              width: 13.5,
              height: 23.14,
              color: iconColor,
            ),
            Icon(
              Icons.play_arrow_rounded,
              size: 60,
              color: provider.changeContainerColor(),
            ),
            Image(
              image: AssetImage(
                isTextDirectionRTL
                    ? 'assets/images/ic/Ic_metro-back.png'
                    : 'assets/images/ic/Ic_metro-next.png',
              ),
              width: 13.5,
              height: 23.14,
              color: iconColor,
            ),
          ],
        ),
      ],
    );
  }
}
