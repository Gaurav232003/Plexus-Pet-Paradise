import 'dart:ffi';
import 'package:petcare/meddata.dart';
import 'package:flutter/material.dart';

class Meds extends StatelessWidget {
  const Meds({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    var height = s.height;
    var width = s.width;
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Meds near you',
                    style:
                        TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: MedData,
                  ),
                  SizedBox(
                    height: height * 0.05,
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
      ),
    );
  }
}
