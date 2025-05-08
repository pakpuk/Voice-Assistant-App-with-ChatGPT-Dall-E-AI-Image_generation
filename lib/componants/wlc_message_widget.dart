import 'package:flutter/material.dart';
import 'package:voice_assistant_app/theming/colors.dart';

class WlcMessageWidget extends StatefulWidget {
  const WlcMessageWidget({super.key});

  @override
  State<WlcMessageWidget> createState() => _WlcMessageWidgetState();
}

class _WlcMessageWidgetState extends State<WlcMessageWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1).copyWith(
        top: screenHeight * 0.03,
      ),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.015,
        horizontal: screenWidth * 0.05,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.assistantCircleColor),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(screenWidth * 0.04),
          bottomLeft: Radius.circular(screenWidth * 0.04),
          bottomRight: Radius.circular(screenWidth * 0.04),
        ),
      ),
      child: Text(
        "Good Morning! How can I help you today?",
        style: TextStyle(
          fontFamily: 'Cera Pro',
          color: Pallete.mainFontColor,
          fontSize: screenWidth * 0.06,
        ),
      ),
    );
  }
}
