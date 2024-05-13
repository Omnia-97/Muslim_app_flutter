import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/islami_app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/model/radio_response.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class CustomRadioWidget extends StatefulWidget {
  Radios radios;
  AudioPlayer audioPlayer;
  CustomRadioWidget({
    super.key,
    required this.radios,
    required this.audioPlayer,
  });

  @override
  State<CustomRadioWidget> createState() => _CustomRadioWidgetState();
}

class _CustomRadioWidgetState extends State<CustomRadioWidget> {
  bool isTaped = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<MyProvider>(context);
    Color iconColor = theme.brightness == Brightness.light
        ? MyThemeData.primaryColor
        : MyThemeData.amberColor;
    bool isTextDirectionRTL = Directionality.of(context) == TextDirection.rtl;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            widget.radios.name ?? AppLocalizations.of(context)!.quranRadio,
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
                width: 18.5,
                height: 28.14,
                color: iconColor,
              ),
              InkWell(
                onTap: () async {
                  isTaped
                      ? await widget.audioPlayer.pause()
                      : await widget.audioPlayer.play(
                          UrlSource(widget.radios.url ?? ""),
                        );
                  setState(() {
                    isTaped = !isTaped;
                  });
                },
                child: Icon(
                  isTaped ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  size: 60,
                  color: provider.changeContainerColor(),
                ),
              ),
              Image(
                image: AssetImage(
                  isTextDirectionRTL
                      ? 'assets/images/ic/Ic_metro-back.png'
                      : 'assets/images/ic/Ic_metro-next.png',
                ),
                width: 18.5,
                height: 28.14,
                color: iconColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
