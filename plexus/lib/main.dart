import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data.dart';
import 'home.dart';
import 'details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);

  // CheckData();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AuthGate(),
  ));
}

void CheckData() async {
  String? email = FirebaseAuth.instance.currentUser!.email;
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('UserData').get();

  var getName = snapshot.child("name");
  var getDob = snapshot.child("dob");
  var getGender = snapshot.child("gender");
  var getType = snapshot.child("type");
  var getBreed = snapshot.child("breed");

  data[0] = getName;
  data[1] = getDob;
  data[2] = getGender;
  data[3] = getType;
  data[4] = getBreed;
}
