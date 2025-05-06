import 'package:flutter/material.dart';
import 'package:voice_assistant_app/theming/colors.dart';
import 'package:voice_assistant_app/utils/constants.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: Pallete.assistantCircleColor,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: 123,
          width: 120,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(Constants.assetAvatar)),
          ),
        )
      ],
    );
  }
}
