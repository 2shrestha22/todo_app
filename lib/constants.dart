import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const String introBox = 'intro';
const String todoBox = 'todo';

const String appName = 'Todo';

const Color primaryColor = Color(0xFFFF454B66);

const kPadding = 8.0;
const kBorderRadius = 24.0;

const kShadow = [
  BoxShadow(
    color: Colors.black26,
    blurRadius: 4,
  )
];

class Constants {
  static const title =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
  static const subtitle = TextStyle(color: Colors.black, fontSize: 15);
  static const time = TextStyle(color: Colors.black, fontSize: 15);
}
