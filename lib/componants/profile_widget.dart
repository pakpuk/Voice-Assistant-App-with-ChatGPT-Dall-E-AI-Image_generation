import 'package:flutter/material.dart';
import 'package:voice_assistant_app/theming/colors.dart';
import 'package:voice_assistant_app/utils/constants.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    // Scale profile size (120 is base size)
    final profileSize = screenWidth * 0.3; // 30% of screen width

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          height: profileSize,
          width: profileSize,
          decoration: BoxDecoration(
            color: Pallete.assistantCircleColor,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: profileSize + 3, // same +3 offset as original
          width: profileSize,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Constants.assetAvatar),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
