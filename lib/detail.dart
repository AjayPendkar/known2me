

import 'package:flutter/material.dart';

import 'model/Employee.dart';

class DetailPage extends StatelessWidget {
  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.firstName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // padding: const EdgeInsets.fromLTRB(50, 100, 10, 40),
            child: CircleAvatar(
                radius: 50, backgroundImage: NetworkImage(user.imageUrl)),
          ),
          Text(
            user.firstName,
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(width: 10),
          Text(
            user.lastName,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
