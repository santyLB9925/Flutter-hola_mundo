import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hello_world/funciones/showDialogSingleButton.dart';
import 'package:hello_world/model/LoginModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../descripcion.dart';
import '../seleccion.dart';


Future<LoginModel> LoginRequest(BuildContext context, String email, String password) async {
  final url = "https://6ce0ab0f069e.ngrok.io/api/login";


  Map<String, String> body = {
    'email': email,
    'password': password,
  };

  final response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Seleccion(
    )));

    return LoginModel.fromJson(responseJson);
  } else if(response.statusCode == 429){
    Map<String, dynamic> sesion = jsonDecode(response.body);
    var intentoMax = sesion['intentosMaximos'];
    var time= sesion['tiempoEspera'];
    showDialogSingleButton(context, "Se alcanzó el limite de intentos: "+intentoMax.toString(), "Vuelve a intentar en: "+time.toString()+" minuto(s)", "OK");
  }else{
    Map<String, dynamic> sesion = jsonDecode(response.body);
    var intento = sesion['intento_actual'];
    showDialogSingleButton(context, "No se puede iniciar sesión", "Intento actual: "+intento.toString(), "OK");
    return null;
  }
}