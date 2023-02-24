import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

List<Widget> VetData = [
  VetTemplate(vname: 'Vet 1', lat: '12', long: '14', vphone: '+91 1111111'),
  VetTemplate(vname: 'Vet 2', lat: '12', long: '14', vphone: '+91 1111111'),
  VetTemplate(vname: 'Vet 2', lat: '12', long: '14', vphone: '+91 1111111'),
  VetTemplate(vname: 'Vet 2', lat: '12', long: '14', vphone: '+91 1111111'),
  VetTemplate(vname: 'Vet 2', lat: '12', long: '14', vphone: '+91 1111111'),
  VetTemplate(vname: 'Vet 2', lat: '12', long: '14', vphone: '+91 1111111'),
  VetTemplate(vname: 'Vet 1', lat: '12', long: '14', vphone: '+91 1111111'),
  VetTemplate(vname: 'Vet 2', lat: '12', long: '14', vphone: '+91 1111111'),
  VetTemplate(vname: 'Vet 2', lat: '12', long: '14', vphone: '+91 1111111'),
  VetTemplate(vname: 'Vet 2', lat: '12', long: '14', vphone: '+91 1111111'),
  VetTemplate(vname: 'Vet 2', lat: '12', long: '14', vphone: '+91 1111111'),
];

class VetTemplate extends StatelessWidget {
  final String vname;
  final String lat;
  final String long;
  final String vphone;

  VetTemplate(
      {required this.vname,
      required this.lat,
      required this.long,
      required this.vphone});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(vname),
        Text('2km'),
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
