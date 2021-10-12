// ignore_for_file: prefer_const_constructors
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/pages/home_page.dart';
import 'package:helloflutter/pages/home_page_with_fb.dart';
import 'package:helloflutter/pages/home_page_with_sb.dart';
import 'package:helloflutter/pages/login_page.dart';
import 'package:helloflutter/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  // widgets
  // material app
  // cupertino app
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
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
      home: Constants.prefs.getBool("loggedIn") == true
          ? HomePageSB()
          : LoginPage(),
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
