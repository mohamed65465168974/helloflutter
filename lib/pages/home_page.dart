import 'package:flutter/material.dart';
import 'package:helloflutter/drawer.dart';
import 'package:helloflutter/name_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = "change my name";
  TextEditingController _nameController = TextEditingController();

  // initialize var before creating widgets
  @override
  void initState() {
    super.initState();
  }

  // called when screen is destroyed 
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome app'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: NameCardWidget(myText: myText, nameController: _nameController),
          ),
        ),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          // called every time a change is made
          setState(() {});
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
