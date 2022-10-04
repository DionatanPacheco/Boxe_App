import 'package:flutter/material.dart';

AppBar getSignAppBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 6, 6, 6),
    title: const Text(
      'Cadastro',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
  );
}
