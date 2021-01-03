import 'package:flutter/material.dart';

class Infouser extends StatelessWidget {
  Infouser(
    this.userImage,
    this.userName,
    this.userEmail,
  );

  final String userName;
  final String userImage;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(userImage),
        ),
        Text(
          userName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(userEmail),
      ],
    );
  }
}
