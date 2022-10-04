// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:boxe_app/page/trainer/trainer_widget/trainer_list_model.dart';
import 'package:flutter/material.dart';

class TrainerListItens extends StatefulWidget {
  final TrainerListModel trainerListModel;
  const TrainerListItens({
    key,
    required this.trainerListModel,
  }) : super(key: key);

  @override
  State<TrainerListItens> createState() => _TrainerListItensState();
}

class _TrainerListItensState extends State<TrainerListItens> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 15,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 4, 8, 230),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      ),
      Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 248, 248, 250),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                widget.trainerListModel.assetIcon,
                height: 30,
              ),
              Text(
                widget.trainerListModel.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    ]);
  }
}
