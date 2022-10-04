import 'package:boxe_app/page/trainer/trainer_widget/trainer_list_model.dart';
import 'package:flutter/material.dart';

class TrainerModalAdd extends StatefulWidget {
  final List<TrainerListModel> listModel;
  final Function fncRefresh;
  const TrainerModalAdd(
      {key, required this.listModel, required this.fncRefresh})
      : super(key: key);

  @override
  State<TrainerModalAdd> createState() => _TrainerModalAddState();
}

class _TrainerModalAddState extends State<TrainerModalAdd> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Criar Academia',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Qual é o nome da Academia?",
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            ElevatedButton(
                onPressed: () {
                  addInList();
                },
                child: const Text("Criar"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black87)))
          ],
        )),
      ),
    );
  }

  addInList() {
    TrainerListModel tml = TrainerListModel(
        title: _nameController.text, assetIcon: "assets/boxe.png");
    setState(() {
      widget.listModel.add(tml);
    });

    widget.fncRefresh();
    Navigator.pop(context);
  }
}
