// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:helloflutter/widgets/drawer.dart';
import 'package:helloflutter/pages/login_page.dart';
import 'package:helloflutter/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;
  // initialize var before creating widgets
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    // async  several tasks at the same time
    // sync one task at a time
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    setState(() {});
    print(data);
  }

  // called when screen is destroyed
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
            Navigator.pushReplacementNamed(context,LoginPage.routeName);
          },
          icon: Icon(Icons.exit_to_app),
        )
      ]),
      body: data != null
          ? ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    data[index]["title"],
                  ),
                  subtitle: Text("ID: ${data[index]["id"]}"),
                  leading: Image.network(data[index]["url"]),
                );
              },
              itemCount: data.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.send),
      ),
    );
  }
}
