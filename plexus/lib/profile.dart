import 'dart:math';
import 'package:flutter/material.dart';
import 'package:petcare/details.dart';
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

class HomePageProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blueGrey[800],
      home: Scaffold(
          backgroundColor: Colors.blueGrey[800],
          body: Container(
            padding: EdgeInsets.only(top: 100.0),
            child: Column(
              children: <Widget>[
                //Loading bar
                // Visibility(
                //   visible: true,
                //   child: LinearProgressIndicator(
                //     backgroundColor: Colors.grey[200],
                //     valueColor: AlwaysStoppedAnimation<Color>(
                //         Color.fromRGBO(255, 193, 75, 1)),
                //   ),
                // ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/Dog$rng.jpg'),
                ),
                Text(
                  data[0],
                  style: TextStyle(
                    fontSize: 60.0,
                    color: Color.fromARGB(233, 202, 199, 199),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                  ),
                ),
                Text(
                  data[4],
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey[300],
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Source Sans Pro"),
                ),
                SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(
                    color: Color.fromARGB(255, 243, 229, 229),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // we will be creating a new widget name info carrd

                InfoCard(
                  text: data[1],
                  icon: Icons.date_range_rounded,
                ),
                SizedBox(
                  height: 20,
                ),
                InfoCard(text: data[3], icon: Icons.pets),
                SizedBox(
                  height: 20,
                ),

                InfoCard(text: email!, icon: Icons.email),
              ],
            ),
          )),
    );
  }
}

class InfoCard extends StatelessWidget {
  // the values we need
  final String text;
  final IconData icon;

  InfoCard({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(233, 202, 199, 199),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: ListTile(
        leading: Icon(
          icon,
          color: Color.fromARGB(255, 83, 13, 13),
        ),
        title: Text(
          text,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: "Source Sans Pro"),
        ),
      ),
    );
  }
}
