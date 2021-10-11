// ignore_for_file: prefer_const_constructors
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/pages/home_page.dart';
import 'package:helloflutter/pages/login_page.dart';

void main() {
  // widgets
  // material app
  // cupertino app
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        LoginPage.routeName : (context) => LoginPage(),
        HomePage.routeName : (context) => HomePage(),
      },
    );
  }
}
