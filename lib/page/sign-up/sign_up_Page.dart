// ignore_for_file: file_names, avoid_print, prefer_typing_uninitialized_variables

import 'package:boxe_app/page/sign-up/sign_up_service.dart';
import 'package:boxe_app/page/sign-up/widgets/sign_appbar.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final TextEditingController _confirmInputController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isChecked = false;
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getSignAppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Color.fromARGB(255, 172, 216, 247)],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameInputController,
                        autofocus: true,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                            labelText: "Nome Completo",
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            )),
                      ),
                      TextFormField(
                        controller: _mailInputController,
                        validator: (value) {
                          if (value!.length < 6) {
                            return "A senha deve ter no mínimo 6 caracteres!";
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
                        controller: _passwordInputController,
                        autofocus: true,
                        obscureText: (showPassword == true) ? false : true,
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
                      (showPassword == false)
                          ? TextFormField(
                              controller: _confirmInputController,
                              validator: (value) {
                                if (value!.length < 6) {
                                  return "A senha deve ter no mínimo 6 caracteres!";
                                }
                                return null;
                              },
                              autofocus: true,
                              obscureText: true,
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 11, 9, 9)),
                              decoration: const InputDecoration(
                                  labelText: "Confirme a Senha",
                                  labelStyle: TextStyle(color: Colors.black),
                                  prefix: Icon(Icons.vpn_key_sharp),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            )
                          : Container(),
                      Row(children: [
                        Checkbox(
                            checkColor: const Color.fromARGB(255, 9, 9, 9),
                            value: showPassword,
                            onChanged: (bool? value) {
                              setState(() {
                                showPassword = value!;
                              });
                            }),
                        const Text("Mostrar Senha")
                      ]),
                    ],
                  )),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black87),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
                  onPressed: () => _doSignUp(),
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(color: Color.fromARGB(255, 252, 252, 252)),
                  )),
            ]),
          ),
        ));
  }

  void _doSignUp() {
    if (_formkey.currentState?.validate() == true) {
      SignUpServices.signUp(
        _mailInputController.text,
        _passwordInputController.text,
      );
    } else {
      print("Invalido");
    }
  }
}
    //LoguinModel newUser = LoguinModel(
    //  name: _nameInputController.text,
    //  mail: _mailInputController.text,
    //  password: _passwordInputController.text,
    //  keepn: true,
    //);

  

