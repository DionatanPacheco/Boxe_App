// ignore_for_file: unused_import, non_constant_identifier_names

import 'dart:convert';

import 'package:boxe_app/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoguinServices {
  var url = Uri.https(Routes.signUp, "/");
  Loguin(String email, String password) async {
    Uri uri = Uri.https(Routes.login, '/');
    http.Response response = await http.post(uri,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
    return response;
  }
}
