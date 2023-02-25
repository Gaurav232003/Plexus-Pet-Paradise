import 'package:flutter/material.dart';

class AdoptionTemp extends StatelessWidget {
  const AdoptionTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UploadAdoptionDetails()),
            );
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(children: [
            Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/adog1jpg'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        )),
      ),
    );
  }
}

class UploadAdoptionDetails extends StatelessWidget {
  const UploadAdoptionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        child: Column(),
      )),
    );
  }
}
