import 'package:flutter/material.dart';

class Util {
  static void openNavigator(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
