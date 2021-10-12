// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('pawn kumar'),
            accountEmail: Text("mohamed@gamil.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://media.istockphoto.com/photos/middle-aged-man-portrait-picture-id1285156699?k=20&m=1285156699&s=612x612&w=0&h=9DKYOVJ2DRX3iKrCJEI5UPN2ht1OfrCGUvj10W0eJV4="),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("pawn kumar"),
            subtitle: Text('developer'),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("mohamed kumar"),
            subtitle: Text('developer'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("ahmed kumar"),
            subtitle: Text('developer'),
            trailing: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
