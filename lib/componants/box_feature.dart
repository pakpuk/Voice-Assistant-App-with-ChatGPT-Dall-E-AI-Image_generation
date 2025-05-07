import 'package:flutter/material.dart';
import 'package:voice_assistant_app/theming/colors.dart';
import 'package:voice_assistant_app/utils/constants.dart';

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
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: boxcolor, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0).copyWith(
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              boxtitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Cera Pro',
                fontSize: 20,
                color: Pallete.mainFontColor,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                boxsubtitle,
                style: TextStyle(
                  color: Pallete.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
