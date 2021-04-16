import 'package:flutter/material.dart';
import 'Connection/connection.dart';
import 'Navigation/nav.dart';

void main() async {
  await init();
  runApp(MaterialApp(home: MyApp()));
}
