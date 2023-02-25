import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class VetStore extends StatefulWidget {
  const VetStore({super.key});

  @override
  State<VetStore> createState() => _VetStoreState();
}

class _VetStoreState extends State<VetStore> {
  final userNameController = TextEditingController();
  final userLat = TextEditingController();
  final userLong = TextEditingController();
  final userPhone = TextEditingController();
  final userEmail = TextEditingController();

  late DatabaseReference dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('PetShop');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          TextField(
            controller: userNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Vet name',
            ),
          ),
          TextField(
            controller: userLat,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Vet lat',
            ),
          ),
          TextField(
            controller: userLong,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Vet long',
            ),
          ),
          TextField(
            controller: userPhone,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Vet phone',
            ),
          ),
          TextField(
            controller: userEmail,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'email',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Map<String, String> vets = {
                  'name': userNameController.text,
                  'lat': userLat.text,
                  'long': userLong.text,
                  'phone': userPhone.text
                };
                dbRef.push().set(vets);
                userNameController.clear();
                userLat.clear();
                userLong.clear();
                userPhone.clear();
              },
              child: Text("Add")),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back"))
        ],
      )),
    );
  }
}
