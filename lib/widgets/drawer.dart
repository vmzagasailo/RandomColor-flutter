import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user_info.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBar(),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Container(
                  child: InfoUser(),
                ),
              ),
              Divider(),
              Text('')
            ],
          ),
          Column(children: [
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ]),
        ],
      ),
    );
  }
}
