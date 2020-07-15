import 'package:flutter/material.dart';
import 'api.dart';
import 'nav.dart';

void main() async {
  await init();
  runApp(MaterialApp(home: MyApp()));
}
