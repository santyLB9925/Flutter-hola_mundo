import 'package:flutter/material.dart';
import 'package:hello_world/registroProveedor.dart';
import 'package:hello_world/registroTienda.dart';


class Descripcion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          Container(
            child: Card(
              elevation: 3,
              margin: EdgeInsets.fromLTRB(10, 210, 10, 0),
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
                              text: 'Selecciona \nTu ',
                              style: TextStyle(color: Colors.black,fontFamily: 'Proximanova',fontSize: 40,fontWeight: FontWeight.bold),
                              children: <TextSpan> [
                                TextSpan(
                                    text: 'Categoria',
                                    style: TextStyle(color: Colors.green)),
                                TextSpan(
                                    text: '.',
                                    style: TextStyle(color: Colors.green)),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Center(

                    child: Container(

                      margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
                      width: 280,
                      height: 50.0,
                      child: RaisedButton(

                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistroTienda(
                            )));
                          },
                          child: Text("Soy Tiendita",
                              style: TextStyle(color: Colors.white, fontSize: 20.0,fontFamily: "Proximanova",fontWeight: FontWeight.normal)),
                          color: Color.fromRGBO(52, 229, 82, 100),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0))
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 35, 0, 30),
                      width: 280,
                      height: 50.0,

                      child: OutlineButton.icon(

                          icon: Image.network(""),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistroProveedor(
                            )));
                          },
                          label:Text("Soy Proveedor",
                              style: TextStyle(color: Colors.black, fontSize: 18.0,fontFamily: "Proximanova",fontWeight: FontWeight.bold)),
                          borderSide: BorderSide(color: Colors.black,width: 2),

                          color: Colors.white,
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0))

                      ),
                    ),
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
