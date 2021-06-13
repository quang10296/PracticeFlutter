import 'package:flutter/material.dart';

class Palette {
  static const Color quangWhiteColor = Color(0xFFFFFFFF);

  static const LinearGradient createQuangColorGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
