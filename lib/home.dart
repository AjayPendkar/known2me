import 'package:apitest/model/Employee.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'detail.dart';

class RemoteJson extends StatefulWidget {
  @override
  _RemoteJsonState createState() => _RemoteJsonState();
}

class _RemoteJsonState extends State<RemoteJson> {
  Future<List<User>> _getUsers() async {
    var data = await http
        .get("https://mocki.io/v1/bb81c38f-a52f-4b36-9a1c-5d39c000b433");

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["lastName"], u["firstName"], u["imageUrl"]);

      users.add(user);
    }

    print(users.length);

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("user data from internet"),
      ),
      body: Container(
        child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data[index].imageUrl),
                      ),
                      title: Text(snapshot.data[index].firstName),
                      subtitle: Text(snapshot.data[index].lastName),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(snapshot.data[index])));
                      },
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
