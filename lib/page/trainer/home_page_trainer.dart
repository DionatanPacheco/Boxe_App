import 'package:boxe_app/models/user_trainner.dart';
import 'package:boxe_app/page/trainer/trainer_widget/trainer_appbar.dart';
import 'package:boxe_app/page/trainer/trainer_widget/trainer_bodywidget.dart';
import 'package:boxe_app/page/trainer/trainer_widget/trainer_dawer.dart';
import 'package:flutter/material.dart';

class HomePageTrainer extends StatefulWidget {
  const HomePageTrainer({Key? key}) : super(key: key);

  @override
  State<HomePageTrainer> createState() => _HomePageTrainerState();
}

class _HomePageTrainerState extends State<HomePageTrainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const TrainerDrawer(),
        appBar: getTrainerAppBar(),
        body: HomeTrainerBodyWigdget(UserTrainer('123',
            id: '100',
            name: 'Dionatan',
            mail: 'dionatan@email',
            cpf: '0098',
            birthDate: '10/09')));
  }

  refreshPage() {
    setState(() {});
  }
}
