import 'package:flutter/material.dart';

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
