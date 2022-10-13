import 'dart:async';

import 'package:boxe_app/page/home/home_Page.dart';
import 'package:boxe_app/page/loguin/loguin_Page.dart';
import 'package:boxe_app/page/timer/timer.dart';
import 'package:boxe_app/page/timer2/timer2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boxe App',
      home: LoguinPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
