import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_assistant_app/componants/box_feature.dart';
import 'package:voice_assistant_app/componants/profile_widget.dart';
import 'package:voice_assistant_app/componants/wlc_message_widget.dart';

import 'package:voice_assistant_app/theming/colors.dart';
import 'package:voice_assistant_app/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  String lastWords = '';
  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    speechToText.stop();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        title: Text(Constants.Appbartitle),
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ProfileWidget(),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            WlcMessageWidget(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.025),
              margin: EdgeInsets.only(left: screenWidth * 0.05),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Constants.featureTitle,
                  style: TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Pallete.mainFontColor,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                BoxFeature(
                  boxcolor: Pallete.firstSuggestionBoxColor,
                  boxtitle: Constants.firsbxtitl,
                  boxsubtitle: Constants.firsboxsubtitle,
                ),
                BoxFeature(
                  boxcolor: Pallete.secondSuggestionBoxColor,
                  boxtitle: Constants.scnbxtitl,
                  boxsubtitle: Constants.secnboxsubtitle,
                ),
                BoxFeature(
                  boxcolor: Pallete.thirdSuggestionBoxColor,
                  boxtitle: Constants.firsbxtitl,
                  boxsubtitle: Constants.thirdboxsubtitle,
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            await stopListening();
          } else {
            speechToText.stop();
          }
        },
        backgroundColor: Pallete.firstSuggestionBoxColor,
        child: Icon(Icons.mic),
      ),
    );
  }
}
