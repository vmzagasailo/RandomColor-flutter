import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user_info.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (ctx, futureSnapshot) {
          return FutureBuilder(
            future: Firestore.instance
                .collection('users')
                .document(futureSnapshot.data.uid)
                .get(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return Text(' ');
              }

              return Drawer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppBar(),
                        Padding(
                          padding: EdgeInsets.only(top: 15, left: 15),
                          child: Infouser(
                            userSnapshot.data['image_url'],
                            userSnapshot.data['username'],
                            userSnapshot.data['email'],
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
            },
          );
        });
  }
}
