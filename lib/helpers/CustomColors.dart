// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustonColors {
  Color activivePrimaryButton = Colors.blueAccent;
  final Color _appbarMainColor = const Color.fromARGB(221, 6, 6, 6);
  Color getActivePrimaryButtonCollor() {
    return activivePrimaryButton;
  }

  Color getAppBarMainColor() {
    return _appbarMainColor;
  }
}
