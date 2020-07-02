import 'package:flutter/material.dart';
import 'package:hello_world/funciones/showDialogSingleButton.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import '../main.dart';


RegisterProveedor(BuildContext context, String nombre, String apellidoP, String apellidoM,String marca,String telefono,String direccion,String correo,String password) async {
  final url = "https://6ce0ab0f069e.ngrok.io/api/registro-proveedor";

  Map<String, String> body = {
    'nombre': nombre,
    'apellido_paterno': apellidoP,
    'apellido_materno': apellidoM,
    'marca': marca,
    'telefono': telefono,
    'direccion':direccion,
    'correo':correo,
    'password':password

  };
  final response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {
    showDialogSingleButton(context, "Su proveedora se creó con éxito", "Ya puedes iniciar sesion", "OK");
    Navigator.push(context,MaterialPageRoute(builder:(context)=>MyHomeForm()));
  } else {
    showDialogSingleButton(context, "No se puede crear tienda", "Verifique sus datos", "OK");
  }
}