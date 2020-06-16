import 'package:flutter/services.dart';
import 'package:hello_world/api/LoginRequest.dart';
import 'package:hello_world/descripcion.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello world',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color.fromRGBO(30, 126, 222, 10.0),
        automaticallyImplyLeading: false,
      ),
      body:ListView(
        children: <Widget>[
          Container(
            child: Card(
              elevation: 3,
              margin: EdgeInsets.fromLTRB(37, 50, 37, 30),
              child: Wrap(
                children: <Widget>[
                  Container(
                      child: Center(
                       // padding: EdgeInsets.fromLTRB(90.0, 40.0, 0.0, 15.0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0),
                          child: Text("Welcome",
                            style: TextStyle(fontSize: 30.0, color: Colors.black),
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(45.0, 5.0, 30.0, 50.0),
                    child: Image.asset("images/icon2.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50.0, 0.0, 30.0, 0.0),
                    child: Text("Usuario",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(45.0, 5.0, 45.0, 0.0),
                    child: TextField(
                      controller: _userController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18.0)),
                          contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0)
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50.0, 20.0, 45.0, 0.0),
                    child: Text(
                      "Contraseña",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(45.0, 5.0, 45.0, 15.0),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18.0)),
                          contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0)
                      ),
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      width: 180,
                      height: 50.0,
                      child: RaisedButton(

                          onPressed: () {
                            SystemChannels.textInput.invokeMethod('TextInput.hide');
                            LoginRequest(context, _userController.text, _passwordController.text);

                          },
                          child: Text("Iniciar sesion",
                              style: TextStyle(color: Colors.white, fontSize: 14.0)),
                          color: Colors.blue,
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 40.0, 90.0, 0.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
