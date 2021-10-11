import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  // widgets
  // material app
  // cupertino app
  runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome app'),
      ),
      body: Container(
        child: Text("hi flutter"),
      ),
    );
  }
}
