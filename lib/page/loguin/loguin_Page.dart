// ignore_for_file: file_names, unused_element, prefer_typing_uninitialized_variables, avoid_print, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables

import 'package:boxe_app/page/home/home_Page.dart';
import 'package:boxe_app/page/loguin/wdgets/loguin_forn_form.dart';
import 'package:boxe_app/page/loguin/wdgets/loguin_signup_invite.dart';
import 'package:flutter/material.dart';

import 'package:boxe_app/helpers/assets_name_helper.dart';

class LoguinPage extends StatefulWidget {
  const LoguinPage({Key? key}) : super(key: key);

  @override
  State<LoguinPage> createState() => _LoguinPageState();
}

class _LoguinPageState extends State<LoguinPage> {
  bool animForm = false;
  bool animLogo = false;
  @override
  void initState() {
    super.initState();
    activeAnimLogo();
  }

  activeAnimLogo() async {
    await Future.delayed(const Duration(seconds: 1));
    animLogo = true;
  }

  set jsonUser(String jsonUser) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue, Color.fromARGB(255, 172, 216, 247)],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          reverse: false,
          child: AnimatedPositioned(
            duration: const Duration(seconds: 1),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    AssetsNameHelper.assetLogo,
                    height: 200,
                  ),
                  GestureDetector(
                    onTap: (() {
                      setState(() {});
                    }),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.elasticIn,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        animForm = !animForm;
                      });
                    },
                    child: Visibility(
                      child: Container(
                        padding: const EdgeInsets.only(top: 4),
                        child: const Text(
                          'Clique para começar',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: animForm,
                    child: SingleChildScrollView(
                      reverse: true,
                      scrollDirection: Axis.vertical,
                      child: AnimatedContainer(
                        curve: Curves.bounceIn,
                        margin: const EdgeInsets.only(top: 10),
                        duration: const Duration(seconds: 1),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              const Text(
                                "Entrar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 8, 8, 8),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const LoguinForm(),
                              const LoguinSignUpInvite(),
                              FloatingActionButton(
                                  backgroundColor:
                                      const Color.fromARGB(255, 7, 6, 6),
                                  child: (const Icon(Icons.add)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()));
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    ));
  }
}
