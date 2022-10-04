// ignore_for_file: file_names

import 'package:boxe_app/page/home/home_widgets/home_appbar.dart';
import 'package:boxe_app/page/home/home_widgets/home_content.dart';
import 'package:boxe_app/page/home/home_widgets/home_drawer.dart';
import 'package:boxe_app/page/home/home_widgets/home_f.a.b.dart';
import 'package:flutter/material.dart';

import 'home_widgets/home_listmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0;
  List<HomeListModel> listModel = [
    HomeListModel(
      title: 'Gigantes do Ringue',
      assetIcon: "assets/boxe.png",
    ),
    HomeListModel(
      title: 'Construíndo Gigantes',
      assetIcon: "assets/boxe.png",
    ),
    HomeListModel(title: 'Gigantes', assetIcon: "assets/boxe.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: getHomeAppBar(),
      body: HomePageContent(
        listModel: listModel,
      ),
      floatingActionButton: getHomeFAB(context, listModel, refreshPage),
    );
  }

  refreshPage() {
    setState(() {});
  }
}
