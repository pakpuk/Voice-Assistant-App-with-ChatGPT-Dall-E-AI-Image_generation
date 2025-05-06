import 'package:flutter/material.dart';
import 'package:voice_assistant_app/theming/colors.dart';
import 'package:voice_assistant_app/view/Home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(scaffoldBackgroundColor: Pallete.whiteColor),
      home: const HomePage(),
    );
  }
}
