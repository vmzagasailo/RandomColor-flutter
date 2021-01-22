import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InfoUser extends StatelessWidget {
  Future _getUserId() async {
    final user = await FirebaseAuth.instance.currentUser();

    return user;
  }

  Future _getUserInfo() async {
    final user = await FirebaseAuth.instance.currentUser();
    final userData =
        await Firestore.instance.collection('users').document(user.uid).get();

    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getUserId(),
        builder: (ctx, futureSnapshot) {
          return FutureBuilder(
            future: _getUserInfo(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      userSnapshot.data['image_url'],
                    ),
                  ),
                  Text(
                    userSnapshot.data['username'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(userSnapshot.data['email']),
                ],
              );
            },
          );
        });
  }
}
