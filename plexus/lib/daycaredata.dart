import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

List<Widget> DayCareData = [
  DayCareTemplate(vname: 'DayCare 1', vdist: '5 km', vphone: '+91 1111111'),
  DayCareTemplate(vname: 'DayCare 2', vdist: '7 km', vphone: '+91 1111111'),
  DayCareTemplate(vname: 'DayCare 2', vdist: '7 km', vphone: '+91 1111111'),
  DayCareTemplate(vname: 'DayCare 2', vdist: '7 km', vphone: '+91 1111111'),
  DayCareTemplate(vname: 'DayCare 2', vdist: '7 km', vphone: '+91 1111111'),
  DayCareTemplate(vname: 'DayCare 2', vdist: '7 km', vphone: '+91 1111111'),
  DayCareTemplate(vname: 'DayCare 1', vdist: '5 km', vphone: '+91 1111111'),
  DayCareTemplate(vname: 'DayCare 2', vdist: '7 km', vphone: '+91 1111111'),
  DayCareTemplate(vname: 'DayCare 2', vdist: '7 km', vphone: '+91 1111111'),
  DayCareTemplate(vname: 'DayCare 2', vdist: '7 km', vphone: '+91 1111111'),
  DayCareTemplate(vname: 'DayCare 2', vdist: '7 km', vphone: '+91 1111111'),
];

class DayCareTemplate extends StatelessWidget {
  final String vname;
  final String vdist;
  final String vphone;

  DayCareTemplate(
      {required this.vname, required this.vdist, required this.vphone});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(vname),
        Text(vdist),
        GestureDetector(
            onTap: () async {
              bool? call = await FlutterPhoneDirectCaller.callNumber(vphone);
            },
            child: Icon(Icons.call)),
        SizedBox(
          height: 50.0,
        )
      ],
    );
  }
}
