import 'dart:ffi';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:petcare/searchscreen.dart';
import 'package:petcare/tempData/vetstore.dart';
import 'package:petcare/vetsdata.dart';
import 'package:flutter/material.dart';
import 'package:petcare/tempData/vetstore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class Vets extends StatefulWidget {
  @override
  State<Vets> createState() => _VetsState();
}

class _VetsState extends State<Vets> {
  Query ref = FirebaseDatabase.instance.reference().child('Vets');

  Widget listItem({required Map mmm}) {
    return Container(
      child: Card(
        color: Color.fromARGB(233, 202, 199, 199),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              mmm['name'],
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                GestureDetector(
                    child: Icon(Icons.map),
                    onTap: () {
                      print(mmm['name']);
                      String nm = mmm['name'];
                      var triggername = nm.replaceAll(' ', '+');

                      launchUrl(
                          Uri.parse('https://maps.google.com?q=$triggername'));
                    }),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                    onTap: () async {
                      bool? call = await FlutterPhoneDirectCaller.callNumber(
                          mmm['phone']);
                    },
                    child: Icon(Icons.call)),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                    onTap: () {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final User user = auth.currentUser!;
                      final uid = user.uid;
                      Map<String, dynamic> userMap = {
                        'name': mmm['name'],
                        'email': mmm['email'],
                        'uid': uid
                      };
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(userMap: userMap)),
                      );
                    },
                    child: Icon(Icons.chat)),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    var height = s.height;
    var width = s.width;
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blueGrey[800],
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context
          //       MaterialPageRoute(builder: (context) => VetStore()),
          //     );
          //   },
          //   child: Icon(Icons.add),
          // ),
          body: Container(
            padding: EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: FirebaseAnimatedList(
                      query: ref,
                      padding: EdgeInsets.all(8.0),
                      reverse: false,
                      itemBuilder: (BuildContext context_,
                          DataSnapshot snapshot,
                          Animation<double> animation,
                          int x) {
                        Map mmm = snapshot.value as Map;
                        mmm['key'] = snapshot.key;
                        return listItem(mmm: mmm);
                      }),
                ),
                ElevatedButton(
                  child: Text("back"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color((0xFF000000))),
                ),
              ],
            ),
          )),
    );
  }
}


/*
Expanded(
              child: new FirebaseAnimatedList(
                  query: FirebaseDatabase.instance.reference().child("Vets"),
                  padding: new EdgeInsets.all(8.0),
                  reverse: false,
                  itemBuilder: (_, DataSnapshot snapshot,
                      Animation<double> animation, int x) {
                    return new ListTile(
                      subtitle: new Text(snapshot.value != null? snapshot.value['name'].toString():"Not found"),
                    );
                  }),
            ),

*/
