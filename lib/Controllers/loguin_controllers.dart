import 'package:boxe_app/constants/routes.dart';
import 'package:flutter/widgets.dart';

class LoguinController {
  ValueNotifier<bool> inloader = ValueNotifier<bool>(false);
  String? mailInputController;
  setLoguin(String value) => mailInputController = value;

  String? __passwordInputController;
  setPass(String value) => __passwordInputController = value;
  Future<bool> auth() async {
    inloader.value = true;
    await Future.delayed(const Duration(seconds: 2));
    inloader.value = false;
    return mailInputController == Routes.login &&
        __passwordInputController == Routes.login;
  }
}
