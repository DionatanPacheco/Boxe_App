import 'package:boxe_app/helpers/CustomColors.dart';
import 'package:flutter/material.dart';

import '../loguin_services.dart';

class LoguinForm extends StatefulWidget {
  const LoguinForm({Key? key}) : super(key: key);

  @override
  State<LoguinForm> createState() => _LoguinFormState();
}

class _LoguinFormState extends State<LoguinForm> {
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  get _formkey => GlobalKey<FormState>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        TextFormField(
          controller: _mailInputController,
          validator: (value) {
            if (value!.length < 6) {
              return "E-mail invalido";
            } else if (value.contains('@')) {
              return "E-mail deve conter @";
            }
            return null;
          },
          autofocus: true,
          style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 11, 9, 9)),
          decoration: const InputDecoration(
              labelText: "E-mail",
              labelStyle: TextStyle(color: Colors.black),
              prefix: Icon(Icons.mail_outline),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        ),
        TextFormField(
          validator: (value) {
            if (value!.length < 6) {
              return "A senha deve ter no mínimo 6 caracteres!";
            }
            return null;
          },
          controller: _passwordInputController,
          autofocus: true,
          obscureText: isChecked,
          style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 11, 9, 9)),
          decoration: const InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(color: Colors.black),
              prefix: Icon(Icons.vpn_key_sharp),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        ),
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? newValue) async => setState(
                () {
                  isChecked = newValue!;
                },
              ),
            ),
            const Text(
              'Mostrar senha',
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            _dologuin();
          },
          child: const Text(
            'Loguin',
            style: TextStyle(color: Color.fromARGB(221, 249, 248, 248)),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              CustonColors().getAppBarMainColor(),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 0)),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "Esqueceu a senha",
            textAlign: TextAlign.right,
          ),
        ),
      ]),
    );
  }

  void _dologuin() async {
    if (_formkey.currentState.validate()) {
      LoguinServices()
          .Loguin(_mailInputController.text, _passwordInputController.text);
    } else {
      print("invalido");
    }
  }
}
