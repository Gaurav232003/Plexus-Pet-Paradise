import 'package:flutter/material.dart';
import 'package:petcare/details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'details.dart';
import 'home.dart';

Widget Check() {
  getData();
  Future.delayed(Duration(seconds: 10), () {
    // Do something
  });
  print(data[0]);
  if (data[0] == "name")
    return Details();
  else
    return Home();
}
