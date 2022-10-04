import 'package:flutter/material.dart';

AppBar getHomeAppBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 6, 6, 6),
    title: const Text('Minhas Academias'),
    centerTitle: true,
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
    ],
  );
}
