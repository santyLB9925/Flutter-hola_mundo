import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hello_world/funciones/showDialogSingleButton.dart';
import 'package:hello_world/model/LoginModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../descripcion.dart';


Future<LoginModel> LoginRequest(BuildContext context, String user, String password) async {
  final url = "https://a81f1725d486.ngrok.io/api/v1/login/";


  Map<String, String> body = {
    'username': user,
    'password': password,
  };

  final response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Descripcion(
    )));

    return LoginModel.fromJson(responseJson);
  } else {
    showDialogSingleButton(context, "No se puede iniciar sesión", "Correo ó contraseña incorrecta", "OK");
    return null;
  }
}