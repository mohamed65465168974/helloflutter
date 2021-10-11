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
        width: 300,
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Container(
          padding: const EdgeInsets.all(8) ,
          width: 100,
          height: 100,
          color: Colors.red,
          alignment: Alignment.center,
        ),
        Container(
          padding: const EdgeInsets.all(8) ,
          width: 100,
          height: 100,
          color: Colors.yellow,
          alignment: Alignment.center,
        ),
        Container(
          padding: const EdgeInsets.all(8) ,
          width: 100,
          height: 100,
          color: Colors.green,
          alignment: Alignment.center,
        ),
        ],),
      ),
    );
  }
}
