import 'package:boxe_app/page/home/home_widgets/home_modal_add.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'home_listmodel.dart';

FloatingActionButton getHomeFAB(
    BuildContext context, List<HomeListModel> listModel, Function fncRefresh) {
  return FloatingActionButton(
    backgroundColor: const Color.fromARGB(255, 7, 6, 6),
    child: (const Icon(Icons.add)),
    onPressed: () {
      showBarModalBottomSheet(
          context: context,
          builder: (context) => HomeModalAdd(
                listModel: listModel,
                fncRefresh: fncRefresh,
              ));
    },
  );
}
