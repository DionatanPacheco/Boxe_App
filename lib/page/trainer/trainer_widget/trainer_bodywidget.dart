// ignore_for_file: use_key_in_widget_constructors

import 'package:boxe_app/models/user_trainner.dart';
import 'package:flutter/material.dart';

class HomeTrainerBodyWigdget extends StatelessWidget {
  final UserTrainer model;
  const HomeTrainerBodyWigdget(this.model);

  @override
  Widget build(BuildContext context) {
    return (!model.isWhithGym)
        ? Column(children: [Image.asset('/assets/chave.png')])
        : Container();
  }
}
