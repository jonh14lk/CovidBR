import 'package:flutter/material.dart';
import 'API_connection/api.dart';
import 'Navigation/nav.dart';

void main() async {
  await init();
  runApp(MaterialApp(home: MyApp()));
}
