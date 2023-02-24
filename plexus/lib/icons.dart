import 'package:flutter/material.dart';

class IconLayout extends StatelessWidget {
  IconLayout({required this.height, required this.txt, required this.avatar});
  final String txt;
  final Icon avatar;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        avatar,
        SizedBox(
          height: height * 0.02,
        ),
        Text(txt),
      ],
    );
  }
}
