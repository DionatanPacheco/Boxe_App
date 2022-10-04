import 'package:boxe_app/page/home/home_widgets/home_listmodel.dart';
import 'package:boxe_app/page/home/home_widgets/home_llistitens.dart';
import 'package:flutter/material.dart';

class HomePageContent extends StatefulWidget {
  final List<HomeListModel> listModel;
  const HomePageContent({key, required this.listModel}) : super(key: key);
  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
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
              return HomeListItens(homeListModel: widget.listModel[index]);
            })));
  }
}
