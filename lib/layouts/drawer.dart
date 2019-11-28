import 'package:flutter/material.dart';
import '../users/get-users.dart';
import '../calculator/index.dart';

class DrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Drawer Header',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Manage Employees'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.check_box),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person_pin_circle),
            title: Text('Manage Users'),
            onTap: () {
              print('tapped !!');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GetUsers()));
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Calculator'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Calculator()));
            },
          )
        ],
      ),
    );
  }
}
