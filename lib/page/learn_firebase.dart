// ignore_for_file: non_constant_identifier_names, unused_element, import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LearnFirebase extends StatefulWidget {
  const LearnFirebase({Key? key}) : super(key: key);

  @override
  State<LearnFirebase> createState() => _LearnFirebaseState();
}

class _LearnFirebaseState extends State<LearnFirebase> {
  List<String> listStrings = <String>["Nenhum Registro carregado."];
  Uri url =
      Uri.https('boxe-app-62ecb-default-rtdb.firebaseio.com', '/words.json');
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: ListView(
            children: [
              TextFormField(
                controller: _controller,
                decoration:
                    const InputDecoration(labelText: 'Insira uma palavra aqui'),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () => _addStringtoBack(),
                child: const Text('Gravar no Firebase'),
              ),
              for (String s in listStrings)
                Text(
                  s,
                  textAlign: TextAlign.center,
                )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getInformationFromBack() {
    return http.get(url).then((response) {
      Map<String, dynamic> map = json.decode(response.body);
      listStrings = [];
      map.forEach((key, value) {
        setState(() {
          listStrings.add(map[key]['word']);
        });
      });
    });
  }

  void _addStringtoBack() {
    http
        .post(
          url,
          body: jsonEncode(
            {'word': _controller.text},
          ),
        )
        .then((value) =>
            {_getInformationFromBack().then((value) => _controller.text = "")});

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(children: const [
      SizedBox(
        width: 20,
      ),
      Expanded(child: Text("Gravado com Sucesso!"))
    ])));
  }
}
