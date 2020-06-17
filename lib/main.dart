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
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Card(
                elevation: 0,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        child: Center(
                         // padding: EdgeInsets.fromLTRB(90.0, 40.0, 0.0, 15.0),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 80.0, 110.0, 10.0),
                            child: RichText(
                              text: TextSpan(
                                text: 'Hello\nThere',
                                style: TextStyle(color: Colors.black,fontFamily: 'Proximanova',fontSize: 60,fontWeight: FontWeight.bold),
                                children: <TextSpan> [
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
                              controller: _userController,
                              validator: (_userController){
                                if(_userController.isEmpty ||_userController == null ){
                                  return "Necesitas llenar este campo";
                                }
                                return null;
                              },
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
                              validator: (_passwordController){
                                if(_passwordController.isEmpty ||_passwordController == null ){
                                  return "Necesitas llenar este campo";
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
                              SystemChannels.textInput.invokeMethod('TextInput.hide');
                              LoginRequest(context, _userController.text, _passwordController.text);
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
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        width: 280,
                        height: 50.0,

                        child: OutlineButton.icon(

                            icon: Image.network("https://img.icons8.com/material-outlined/24/000000/facebook-f.png"),
                            onPressed: (){},
                            label:Text("Log in with Facebook",
                                style: TextStyle(color: Colors.black, fontSize: 18.0,fontFamily: "Proximanova",fontWeight: FontWeight.bold)),
                            borderSide: BorderSide(color: Colors.black,width: 2),

                            color: Colors.white,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0))

                        ),
                      ),
                    ),
                    Center(
                      child: Padding(padding: EdgeInsets.only(right: 60),
                      child: Row(

                        children: <Widget>[
                          Expanded(
                            child: Text('New to Spotify?', textAlign: TextAlign.end),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: <Widget>[
                              FlatButton(
                                child: Text("Register",
                                    style: TextStyle(color: Color.fromRGBO(52, 229, 82, 100),fontFamily: "Proximanova", fontSize: 16.0,decoration: TextDecoration.underline,fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ],
                      ),
                      ),
                    )
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
