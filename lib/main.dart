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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello flutter!'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network("https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/visual-studio-online.jpg?itok=JmzraVZM"),
                  Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 6.0),
                      child: Text(
                        "Foto con animación Hero",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w400),
                      )),
                  Text("Aqui va el subtítulo, la descripción de la card",
                    style: TextStyle(color:Colors.grey,fontSize: 12.0, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.justify,

                  ),

                  Padding(
                      padding:EdgeInsets.only(left: 240,top: 10),
                      child: FlatButton( onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Descripcion()));
                        },
                            child: Text(
                              'Ver más'.toUpperCase(),
                              style: TextStyle(color: Colors.red),
                              textAlign: TextAlign.right,
                            ))
                      ),
                ],
              ),
            ),
          )
        ],
      ),
    );

  }
}

