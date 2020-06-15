import 'package:flutter/material.dart';

class Descripcion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details page'),
      ),
      body: Center(child: Image.network("https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/05/visual-studio-online.jpg?itok=JmzraVZM")),
    );
  }
}
