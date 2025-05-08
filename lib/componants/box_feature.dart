import 'package:flutter/material.dart';
import 'package:voice_assistant_app/theming/colors.dart';

class BoxFeature extends StatelessWidget {
  final Color boxcolor;
  final String boxtitle;
  final String boxsubtitle;

  const BoxFeature({
    super.key,
    required this.boxcolor,
    required this.boxtitle,
    required this.boxsubtitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.012,
      ),
      decoration: BoxDecoration(
        color: boxcolor,
        borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.05)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.025,
        ).copyWith(left: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              boxtitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Cera Pro',
                fontSize: screenWidth * 0.05,
                color: Pallete.mainFontColor,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.025),
              child: Text(
                boxsubtitle,
                style: TextStyle(
                  color: Pallete.blackColor,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
