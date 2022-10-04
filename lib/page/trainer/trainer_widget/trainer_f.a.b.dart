import 'package:boxe_app/page/trainer/trainer_widget/trainer_modal_add.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'trainer_list_model.dart';

FloatingActionButton getTrainerFAB(BuildContext context,
    List<TrainerListModel> listModel, Function fncRefresh) {
  return FloatingActionButton(
    backgroundColor: const Color.fromARGB(255, 7, 6, 6),
    child: (const Icon(Icons.add)),
    onPressed: () {
      showBarModalBottomSheet(
          context: context,
          builder: (context) => TrainerModalAdd(
                listModel: listModel,
                fncRefresh: fncRefresh,
              ));
    },
  );
}
