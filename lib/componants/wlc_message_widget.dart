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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40).copyWith(
        top: 30,
      ),
      padding: EdgeInsetsDirectional.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Pallete.assistantCircleColor),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16)),
      ),
    );
  }
}
