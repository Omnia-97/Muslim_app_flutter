import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/model/radio_response.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/widgets/custom_radio_widget.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  RadioTab({super.key});
  final audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return FutureBuilder(
      future: getRadio(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: provider.changeContainerColor(),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        final radioResponse = snapshot.data as RadioResponse;
        List<Radios> radios = radioResponse.radios ?? [];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Image(
              width: 412,
              height: 222,
              image: AssetImage('assets/images/screens_img/radio_screen.png'),
            ),
            const SizedBox(
              height: 45,
            ),
            Expanded(
              child: ListView.builder(
                physics: const PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CustomRadioWidget(
                  radios: radios[index],
                  audioPlayer: audioPlayer,
                ),
                itemCount: radios.length,
              ),
            )
          ],
        );
      },
    );
  }

  Future<RadioResponse> getRadio() async {
    var url = Uri.parse('https://mp3quran.net/api/v3/radios');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return RadioResponse.fromJson(json);
  }
}
