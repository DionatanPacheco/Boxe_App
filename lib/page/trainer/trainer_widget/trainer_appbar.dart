import 'package:flutter/material.dart';

AppBar getTrainerAppBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 6, 6, 6),
    title: const Text(
      'Atletas',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
    ),
    centerTitle: true,
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
    ],
  );
}
