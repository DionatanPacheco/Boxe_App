// ignore_for_file: unused_import, avoid_web_libraries_in_flutter, import_of_legacy_library_into_null_safe, unused_local_variable

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:boxe_app/constants/routes.dart';
import 'package:flutter/material.dart';

abstract class SignUpServices {
  static signUp(String email, String password) async {
    var url = Uri.https(Routes.signUp, "/");
    var response = await http.post(url,
        body: jsonEncode(
          {
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ));

    // ignore: avoid_print
    print(response);
  }
}
