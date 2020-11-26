import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

List<Estado> estados = [];
List<Pais> countries = [];
List<double> cases = [];
List<double> deaths = [];

class Estado {
  int cases;
  int deaths;
  String state;
  Estado(this.cases, this.deaths, this.state);
  factory Estado.fromJson(dynamic json) {
    return Estado(
        json['cases'] as int, json['deaths'] as int, json['state'] as String);
  }
}

class Pais {
  int confirmed;
  int dead;
  String location;
  double latitude;
  double longitude;
  Pais(
      {this.confirmed,
      this.dead,
      this.location,
      this.latitude,
      this.longitude});
  factory Pais.fromJson(Map<String, dynamic> json) {
    return Pais(
        confirmed: json['confirmed'] as int,
        dead: json['dead'] as int,
        location: json['location'] as String,
        latitude: json['latitude'] as double,
        longitude: json['longitude'] as double);
  }
}

class Pair {
  double first;
  double second;
  Pair(this.first, this.second);
}

List<Estado> parseStates(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Estado>((json) => Estado.fromJson(json)).toList();
}

Future<List<Estado>> fetchStates() async {
  final res = await http.get('https://covid19-brazil-api.now.sh/api/report/v1');
  String st = res.body;
  st = st.substring(8);
  st = st.substring(0, st.length - 1);
  return compute(parseStates, st);
}

List<Pais> parseCountries(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Pais>((json) => Pais.fromJson(json)).toList();
}

Future<List<Pais>> fetchCountries() async {
  final res = await http.get('https://www.trackcorona.live/api/countries');
  String st = res.body;
  st = st.substring(22);
  st = st.substring(0, st.length - 1);
  return compute(parseCountries, st);
}

Future<int> fetchCasesandDeaths() async {
  String link = 'https://covid19-brazil-api.now.sh/api/report/v1/brazil/';
  DateTime now = DateTime.now();

  while (cases.length < 7) {
    String date = DateFormat('yyyyMMdd').format(now);
    final res = await http.get(link + date);
    String st = res.body;
    st = st.substring(8);
    st = st.substring(0, st.length - 1);
    if (st.length > 2) {
      double sum = 0, sum2 = 0;
      List<Estado> curr = parseStates(st);
      for (var i = 0; i < curr.length; i++) {
        sum = sum + curr[i].cases;
        sum2 = sum2 + curr[i].deaths;
      }
      cases.add(sum);
      deaths.add(sum2);
    }
    now = now.subtract(Duration(days: 1));
  }

  cases = cases.reversed.toList();
  deaths = deaths.reversed.toList();

  return 0;
}

Future init() async {
  await fetchCasesandDeaths();
  estados = await fetchStates();
  countries = await fetchCountries();
  estados.sort((a, b) => a.state.compareTo(b.state));
  for (var i = 0; i < estados.length; i++) {
    countries.add(
      Pais(
          confirmed: estados[i].cases,
          dead: estados[i].deaths,
          location: estados[i].state,
          latitude: latlong[i].first,
          longitude: latlong[i].second),
    );
  }
  estados = estados.reversed.toList();
}

List<Pair> latlong = [
  Pair(-8.77, -70.55),
  Pair(-9.71, -35.73),
  Pair(1.41, -51.77),
  Pair(-3.07, -61.66),
  Pair(-12.96, -38.51),
  Pair(-3.71, -38.54),
  Pair(-15.83, -47.86),
  Pair(-19.19, -40.34),
  Pair(-16.64, -49.31),
  Pair(-2.55, -44.30),
  Pair(-12.64, -55.42),
  Pair(-20.51, -54.54),
  Pair(-18.10, -44.38),
  Pair(-24.89, -51.55),
  Pair(-7.06, -35.55),
  Pair(-5.53, -52.29),
  Pair(-8.28, -35.07),
  Pair(-8.28, -43.68),
  Pair(-5.22, -36.52),
  Pair(-30.01, -51.22),
  Pair(-22.84, -43.15),
  Pair(-11.22, -62.80),
  Pair(1.89, -61.22),
  Pair(-27.33, -49.44),
  Pair(-10.90, -37.07),
  Pair(-23.55, -46.64),
  Pair(-10.25, -48.25),
];
