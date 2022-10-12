// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:boxe_app/page/home/home_widgets/home_listmodel.dart';

class HomeListItens extends StatefulWidget {
  final HomeListModel homeListModel;
  const HomeListItens({
    Key? key,
    required this.homeListModel,
  }) : super(key: key);

  @override
  State<HomeListItens> createState() => _HomeListItensState();
}

class _HomeListItensState extends State<HomeListItens> {
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
                widget.homeListModel.assetIcon,
                height: 30,
              ),
              Text(
                widget.homeListModel.title,
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
