import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Abhishek Sen"),
            accountEmail: Text("sybergeek@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/person.jpg"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Abhishek Sen"),
            subtitle: Text("Developer"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("Developer"),
            trailing: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
