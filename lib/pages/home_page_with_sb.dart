// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:helloflutter/widgets/drawer.dart';
import 'package:helloflutter/pages/login_page.dart';
import 'package:helloflutter/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageSB extends StatefulWidget {
  static const routeName = "/home";
  const HomePageSB({Key? key}) : super(key: key);

  @override
  State<HomePageSB> createState() => _HomePageSBState();
}

class _HomePageSBState extends State<HomePageSB> {
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;
  // initialize var before creating widgets

  Future fetchData() async {
    // async  several tasks at the same time
    // sync one task at a time
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    return data;
  }

  Stream<List<String>> getStream() {
    var data = Stream<List<String>>.fromIterable(
        [List<String>.generate(20, (index) => "Item $index")]);
    return data;
  }

  // context is the location of the widget in widget tree
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Awesome app'), actions: [
        IconButton(
          onPressed: () {
            Constants.prefs.setBool("loggedIn", false);
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          },
          icon: Icon(Icons.exit_to_app),
        )
      ]),
      body: StreamBuilder(
        stream: getStream(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text('fetch something'),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text('some error occured'),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      data[index],
                    ),
                  );
                },
                itemCount: data.length,
              );
          }
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.send),
      ),
    );
  }
}
