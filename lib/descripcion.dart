import 'package:flutter/material.dart';

class Descripcion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),

      ),
      body: Center(child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Commons-emblem-success.svg/1200px-Commons-emblem-success.svg.png")),
    );
  }
}
