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
        theme: ThemeData(primarySwatch: Colors.grey),
        home: MyHomeForm());
  }
}
class MyHomeForm extends StatefulWidget{
  @override
  MyHomeFormState createState() {
    return MyHomeFormState();
  }
}
class MyHomeFormState extends State<MyHomeForm> {
  var _formKey = GlobalKey<FormState>();
  Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Card(
                elevation: 3,
                margin: EdgeInsets.fromLTRB(10, 110, 10, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        child: Center(
                         // padding: EdgeInsets.fromLTRB(90.0, 40.0, 0.0, 15.0),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 10.0),
                            child: RichText(
                              text: TextSpan(
                                text: 'Bienvenido \nA ',
                                style: TextStyle(color: Colors.black,fontFamily: 'Proximanova',fontSize: 40,fontWeight: FontWeight.bold),
                                children: <TextSpan> [
                                  TextSpan(
                                      text: 'Quickor',
                                      style: TextStyle(color: Colors.green)),
                                  TextSpan(
                                      text: '.',
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
                            padding: EdgeInsets.fromLTRB(45.0, 40.0, 45.0, 0.0),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              controller: _emailController,
                              validator: (String valor){
                                RegExp regex = new RegExp(pattern);
                                if(!regex.hasMatch(valor) ){
                                  return "Email inválido";
                                }

                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(

                                labelText:"EMAIL" ,
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
                            padding: EdgeInsets.fromLTRB(45.0, 5.0, 45.0, 0.0),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              controller: _passwordController,

                              validator: (String valor){
                                if(valor.isEmpty ||valor == null ){
                                  return "Necesitas llenar este campo";
                                }
                                if(valor.length<6){
                                  return "Error en la longitud de caracteres";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "PASSWORD", contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
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
                          ButtonBar(
                            alignment:MainAxisAlignment.end ,
                            children: <Widget>[
                              FlatButton(
                                child: Text("Forgot Password",
                                    style: TextStyle(color: Color.fromRGBO(52, 229, 82, 100),fontFamily: "Proximanova", fontSize: 16.0,decoration: TextDecoration.underline,fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    Center(

                      child: Container(

                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        width: 280,
                        height: 50.0,
                        child: RaisedButton(

                            onPressed: () {

                              setState(() {
                                if(_formKey.currentState.validate()) {
                                 print("se logueo");
                                 SystemChannels.textInput.invokeMethod('TextInput.hide');
                                 LoginRequest(context, _emailController.text, _passwordController.text);
                                }
                              });


                            },
                            child: Text("Login",
                                style: TextStyle(color: Colors.white, fontSize: 20.0,fontFamily: "Proximanova",fontWeight: FontWeight.normal)),
                            color: Color.fromRGBO(52, 229, 82, 100),
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0))
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 30),
                        width: 280,
                        height: 50.0,

                        child: OutlineButton.icon(

                            icon: Image.network(""),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Descripcion(
                              )));
                            },
                            label:Text("Sign Up",
                                style: TextStyle(color: Colors.black, fontSize: 18.0,fontFamily: "Proximanova",fontWeight: FontWeight.bold)),
                            borderSide: BorderSide(color: Colors.black,width: 2),

                            color: Colors.white,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0))

                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
