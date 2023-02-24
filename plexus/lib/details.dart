import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String? email = FirebaseAuth.instance.currentUser!.email;

  var name = TextEditingController();
  var dob = TextEditingController();
  var type = TextEditingController();
  var breed = TextEditingController();
  var gender = TextEditingController();

  @override
  void initState() {
    // String? email = FirebaseAuth.instance.currentUser!.email;
    // var x = FillData();
    // print(x);

    super.initState();
    // dbRef = FirebaseDatabase.instance.ref().child('UserData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Enter Your Pet's Details",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Name",
                    hintText: 'Enter Name'),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: dob,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Date of Birth',
                    hintText: 'Enter DOB'),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: gender,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Gender',
                    hintText: 'Enter Gender'),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: type,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Type',
                    hintText: 'Which pet do you have?'),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: breed,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Breed',
                    hintText: 'What is the breed of your pet?'),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  Map<String, String> userData = {
                    'email': email!,
                    'name': name.text,
                    'dob': dob.text,
                    'gender': gender.text,
                    'type': type.text,
                    'breed': breed.text
                  };

                  if (name.text.toString() != "") {
                    data[0] = name.text.toString();
                    data[1] = dob.text.toString();
                    data[2] = gender.text.toString();
                    data[3] = type.text.toString();
                    data[4] = breed.text.toString();
                    SendDetailsToDataBase();
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text("submit"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color((0xFF000000))),
              ),
            ],
          )),
    );
  }
}

SendDetailsToDataBase() async {
  String? email = FirebaseAuth.instance.currentUser!.email;
  DatabaseReference ref = FirebaseDatabase.instance.ref('$email');

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference gd =
      FirebaseFirestore.instance.collection('$email');
  _firestore.collection(email.toString()).add({
    "name": data[0],
    "dob": data[1],
    "gender": data[2],
    "type": data[3],
    "breed": data[4]
  });
}

Future FillData() async {
  String? email = FirebaseAuth.instance.currentUser!.email;
  // var dbref = FirebaseFirestore.instance.collection('$email');
  // var userdata = dbref.get();
  // print(userdata);

  var firestore = FirebaseFirestore.instance;
  QuerySnapshot querySnapshot = await firestore.collection("$email").get();
  final documents = querySnapshot.docs;
  // print(documents.toString());
  // var m = documents.asMap();
  // print(m.toString());
  return documents;
}

String? email = FirebaseAuth.instance.currentUser!.email;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<List<Map<String, dynamic>>> fetchData() async {
  final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await _firestore.collection('$email').get();
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
      querySnapshot.docs;
  final List<Map<String, dynamic>> data =
      docs.map((doc) => doc.data()).toList();
  return data;
}

getData() async {
  final List<Map<String, dynamic>> data2 = await fetchData();
  // print(data2[0]['name']);
  if (data2.isNotEmpty) {
    data[0] = data2[0]['name'];
    data[1] = data2[0]['dob'];
    data[2] = data2[0]['gender'];
    data[3] = data2[0]['type'];
    data[4] = data2[0]['breed'];
  }
  // print(data2[0]['name']);
  // print(data2[0]['dob']);
  // print(data2[0]['gender']);
  // print(data2[0]['type']);
  // print(data2[0]['breed']);
}
