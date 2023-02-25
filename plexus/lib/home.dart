import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:petcare/profile.dart';
import 'icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'details.dart';
import 'data.dart';
import 'check.dart';
import 'profile.dart';
import 'pages/vets.dart';
import 'pages/daycare.dart';
import 'pages/grooming.dart';
import 'pages/petparks.dart';
import 'pages/petshops.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'ChatRoom.dart';
import 'adoptiontemp.dart';

import 'pages/meds.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref("UserData");
  Query ref = FirebaseDatabase.instance.reference().child('UserData');
  String email = GetEmail();

  FillDetails({required Map mmm}) {
    print(mmm['email']);

    return SizedBox();
  }

  @override
  void initState() {
    // getUserData();
    FillData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    var height = s.height;
    var width = s.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Container(
            padding: EdgeInsets.only(top: 30.0, right: 20.0),
            child: AppBar(
              title: Text(
                data[0],
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 5.0, right: 5.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageProfile()),
                              );
                            },
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage('assets/Dog$rng.jpg'),
                            )))),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.blueGrey[800],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(),
                child: Text('Hey There'),
              ),
              ListTile(
                title: const Text('Sign Out!'),
                onTap: () {
                  FlutterFireUIAuth.signOut(
                    context: context,
                    auth: auth,
                  );
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 45.0, right: 45.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: IconLayout(
                          height: height,
                          txt: "VET",
                          avatar:
                              Icon(FontAwesomeIcons.stethoscope, size: 80.0),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Vets()),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DayCare()),
                        ),
                        child: IconLayout(
                          height: height,
                          txt: "DAY CARE",
                          avatar: Icon(FontAwesomeIcons.dog, size: 80.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PetShop()),
                        ),
                        child: IconLayout(
                          height: height,
                          txt: "PET SHOPS",
                          avatar: Icon(FontAwesomeIcons.shop, size: 80.0),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PetPark()),
                        ),
                        child: IconLayout(
                          height: height,
                          txt: "PET PARKS",
                          avatar: Icon(Icons.park, size: 80.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: IconLayout(
                          height: height,
                          txt: "GROOMING",
                          avatar: Icon(FontAwesomeIcons.scissors, size: 80.0),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Grooming()),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ImageList()),
                        ),
                        child: IconLayout(
                          height: height,
                          txt: "MED HISTORY",
                          avatar: Icon(Icons.book, size: 80.0),
                        ),
                      ),
                    ],
                  ),
                  // GestureDetector(
                  //   onTap: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => AdoptionTemp()),
                  //   ),
                  //   child: IconLayout(
                  //     height: height,
                  //     txt: "Adoption",
                  //     avatar: Icon(Icons.pets, size: 80.0),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

getUserData() async {
  String? email = FirebaseAuth.instance.currentUser!.email;
  String useEmail = email.toString() != null ? email.toString() : "notfound";

  DatabaseReference dbRef = FirebaseDatabase.instance.ref('UserData');

  Query q = dbRef.child('UserData').orderByChild('email').equalTo('$email');

  DataSnapshot snapshot = await q.get();
}

String GetEmail() {
  String? email = FirebaseAuth.instance.currentUser!.email;
  if (email != null)
    return email;
  else
    return "not found";
}
