import 'package:flutter/material.dart';
import 'package:voice_assistant_app/componants/profile_widget.dart';
import 'package:voice_assistant_app/componants/wlc_message_widget.dart';
import 'package:voice_assistant_app/theming/Text.dart';
import 'package:voice_assistant_app/theming/colors.dart';
import 'package:voice_assistant_app/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextsApp.Appbartitle),
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: Column(
        children: [
          Center(
            child: ProfileWidget(),
          ),
          SizedBox(
            height: 16,
          ),
          WlcMessageWidget(),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constants.featureTitle,
                style: TextStyle(
                  fontFamily: 'Cera Pro',
                  color: Pallete.mainFontColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            children: [],
          )
        ],
      ),
    );
  }
}
