import 'package:flutter/material.dart';
import 'data.dart';
import 'details.dart';
import 'home.dart';

class blankpage extends StatelessWidget {
  const blankpage({super.key});

  @override
  Widget build(BuildContext context) {
    getData();
    Future.delayed(Duration(seconds: 2), () {
      // Do something
      print(data[0]);
      if (data[0] == "name") {
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new Details()));
      } else {
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new Home()));
      }
    });

    return Container();
  }
}
