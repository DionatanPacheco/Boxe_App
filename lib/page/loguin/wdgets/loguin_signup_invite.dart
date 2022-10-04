import 'package:boxe_app/helpers/CustomColors.dart';
import 'package:flutter/material.dart';

import '../../sign-up/sign_up_Page.dart';

class LoguinSignUpInvite extends StatefulWidget {
  const LoguinSignUpInvite({Key? key}) : super(key: key);

  @override
  State<LoguinSignUpInvite> createState() => _LoguinSignUpInviteState();
}

class _LoguinSignUpInviteState extends State<LoguinSignUpInvite> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          const Text(
            "Ainda não tem uma conta?",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  CustonColors().getAppBarMainColor(),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)))),
            onPressed: () {
              const Duration(seconds: 2);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ),
              );
            },
            child: const Text(
              "Cadastra-se",
              style: TextStyle(color: Color.fromARGB(255, 250, 248, 248)),
            ),
          ),
        ],
      ),
    );
  }
}
