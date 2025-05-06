import 'package:flutter/material.dart';
import 'package:voice_assistant_app/theming/Text.dart';

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
    );
  }
}
