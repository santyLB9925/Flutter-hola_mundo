import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/api/RegisterTienda.dart';

class RegistroTienda extends StatelessWidget {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _apellidoPController = TextEditingController();
  final TextEditingController _apellidoMController = TextEditingController();
  final TextEditingController _nombreTiendaController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 3,
              margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      child: Center(
                        // padding: EdgeInsets.fromLTRB(90.0, 40.0, 0.0, 15.0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Registrate ',
                              style: TextStyle(color: Colors.black,fontFamily: 'Proximanova',fontSize: 40,fontWeight: FontWeight.bold),
                              children: <TextSpan> [
                                TextSpan(
                                    text: 'Ahora',
                                    style: TextStyle(color: Colors.green)),

                              ],
                            ),
                          ),
                        ),
                      )),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 20.0, 45.0, 0.0),
                          child: TextFormField(
                            validator: (String valor){
                              if(valor.isEmpty){
                                return "Llene el campo";
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            controller: _nombreController,
                            decoration: InputDecoration(

                              labelText:"Nombre(s)" ,
                              contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                              labelStyle: TextStyle(color: Colors.grey),
                              hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                            ),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
                          child: TextFormField(
                            validator: (String valor){
                              if(valor.isEmpty){
                                return "Llene el campo";
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            controller: _apellidoPController,
                            decoration: InputDecoration(

                              labelText:"Apellido Paterno" ,
                              contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                              labelStyle: TextStyle(color: Colors.grey),
                              hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                            ),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
                          child: TextFormField(
                            validator: (String valor){
                              if(valor.isEmpty){
                                return "Llene el campo";
                              }

                              return null;
                            },
                            cursorColor: Colors.black,
                            controller: _apellidoMController,
                            decoration: InputDecoration(
                              labelText:"Apellido Materno" ,
                              contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                              labelStyle: TextStyle(color: Colors.grey),
                              hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                            ),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
                          child: TextFormField(
                            validator: (String valor){
                              if(valor.isEmpty){
                                return "Llene el campo";
                              }

                              return null;
                            },
                            cursorColor: Colors.black,
                            controller: _nombreTiendaController,
                            decoration: InputDecoration(
                              labelText:"Nombre de la tienda" ,
                              contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                              labelStyle: TextStyle(color: Colors.grey),
                              hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                            ),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
                          child: TextFormField(
                            validator: (String valor){

                              if(valor.length != 10){
                                return "El numero debe tener 10 digitos numéricos";
                              }

                              return null;
                            },
                            cursorColor: Colors.black,
                            controller: _telefonoController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText:"Teléfono" ,
                              contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                              labelStyle: TextStyle(color: Colors.grey),
                              hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                            ),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
                          child: TextFormField(
                            validator: (String valor){
                              if(valor.isEmpty){
                                return "Llene el campo";
                              }


                              return null;
                            },
                            cursorColor: Colors.black,
                            controller: _direccionController,
                            decoration: InputDecoration(
                              labelText:"Dirección" ,
                              contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                              labelStyle: TextStyle(color: Colors.grey),
                              hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                            ),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
                          child: TextFormField(
                            validator: (String valor){
                              RegExp regex = new RegExp(pattern);
                              if(!regex.hasMatch(valor) ){
                                return "Email inválido";
                              }


                              return null;
                            },
                            cursorColor: Colors.black,
                            controller: _correoController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText:"Correo" ,
                              contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                              labelStyle: TextStyle(color: Colors.grey),
                              hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                            ),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: _contrasenaController,
                            validator: (String valor){
                              if(valor.length<6){
                                return "Debe tener más de 6 caracteres";
                              }
                              if(!valor.startsWith(new RegExp(r'[A-Z]'))){
                                return "Debe empezar con una mayúscula";
                              }
                              if(!valor.contains(new RegExp('[!?@]'))){
                                return "Debe tener mínimo un caracter (!?@)";
                              }
                              if(!valor.contains(new RegExp('[0-9]'))){
                                return "Debe tener mínimo un número del 0 al 9";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Contraseña", contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                              labelStyle:TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Center(

                    child: Container(

                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      width: 280,
                      height: 50.0,
                      child: RaisedButton(

                          onPressed: () {

                            if(_formKey.currentState.validate()) {
                              SystemChannels.textInput.invokeMethod('TextInput.hide');
                              RegisterTienda(context, _nombreController.text, _apellidoPController.text,_apellidoMController.text,_nombreTiendaController.text,_telefonoController.text,_direccionController.text,_correoController.text,_contrasenaController.text);
                            }

                          },
                          child: Text("Registrarme",
                              style: TextStyle(color: Colors.white, fontSize: 20.0,fontFamily: "Proximanova",fontWeight: FontWeight.normal)),
                          color: Color.fromRGBO(52, 229, 82, 100),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0))
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}