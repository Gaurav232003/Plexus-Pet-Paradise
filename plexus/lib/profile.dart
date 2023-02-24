import 'package:flutter/material.dart';
import 'data.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

class Profile extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    var height = s.height;
    var width = s.width;
    var name = data[0];
    var dob = data[1];
    var sex = data[2];
    var breed = data[4];
    var type = data[3];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
            body: Container(
          padding: EdgeInsets.only(top: 80.0, right: 20.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 70.0,
                ),
              ),
              SizedBox(
                height: height * 0.12,
              ),
              Text(
                'Name : $name',
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                'DOB : $dob',
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                "sex : $sex",
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                "Type : $type",
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                "breed : $breed",
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              ElevatedButton(
                child: Text('Back'),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
            ],
          ),
        )));
  }
}
