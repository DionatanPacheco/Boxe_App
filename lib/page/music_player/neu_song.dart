import 'package:flutter/material.dart';

class NeuSong extends StatelessWidget {
  final child;
  const NeuSong({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 15,
                offset: const Offset(5, 5)),
            const BoxShadow(
                color: Colors.white, blurRadius: 15, offset: Offset(-5, -5)),
          ]),
      child: Center(child: child),
    );
  }
}
