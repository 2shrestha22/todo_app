import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const String introBox = 'intro';
const String todoBox = 'todo';

const String appName = 'Todo';

const Color primaryColor = Color(0xFFFF454B66);

const kPadding = 16.0;
const kBorderRadius = 8.0;
const kFloatingHeight = 75.0;

const kFloatingPadding = EdgeInsets.only(
  top: kPadding,
  left: kPadding,
  right: kPadding,
  bottom: kFloatingHeight,
);
const kShadow = [
  BoxShadow(
    color: Colors.black26,
    // spreadRadius: 1,
    // offset: Offset(0, 3),
    blurRadius: 4,
  )
];

class Constants {
  static const title =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12);
  static const subtitle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15);
  static const time = TextStyle(
      color: Colors.white, fontWeight: FontWeight.normal, fontSize: 12);
}
