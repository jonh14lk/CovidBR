import 'package:flutter/material.dart';
import 'api.dart';
import 'home.dart';

void main() async {
  await init();
  runApp(MaterialApp(home: MyApp()));
}
