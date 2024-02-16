import 'package:flutter/material.dart';
import 'package:islami_app/islami_app_theme.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: 412,
          height: 222,
          image: AssetImage('assets/images/radio_screen.png'),
        ),
        SizedBox(
          height: 45,
        ),
        Text(
          'إذاعة القرآن الكريم',
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 45,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: AssetImage('assets/images/Ic_metro-back.png'),
              width: 13.5,
              height: 23.14,
            ),
            Icon(
              Icons.play_arrow_rounded,
              size: 60,
              color: MyThemeData.primaryColor,
            ),
            Image(
              image: AssetImage('assets/images/Ic_metro-next.png'),
              width: 13.5,
              height: 23.14,
            ),
          ],
        ),
      ],
    );
  }
}
