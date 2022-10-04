import 'package:boxe_app/page/trainer/trainer_widget/trainer_list_itens.dart';
import 'package:boxe_app/page/trainer/trainer_widget/trainer_list_model.dart';
import 'package:flutter/material.dart';

class TrainerContent extends StatefulWidget {
  final List<TrainerListModel> listModel;
  const TrainerContent({key, required this.listModel}) : super(key: key);
  @override
  State<TrainerContent> createState() => _TrainerContentState();
}

class _TrainerContentState extends State<TrainerContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 15),
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 9, 9, 9),
              Color.fromARGB(255, 104, 104, 104)
            ],
          ),
        ),
        child: ListView.builder(
            itemCount: widget.listModel.length,
            itemBuilder: ((context, index) {
              return TrainerListItens(
                  trainerListModel: widget.listModel[index]);
            })));
  }
}
