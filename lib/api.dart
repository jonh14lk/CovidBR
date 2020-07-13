import 'dart:convert';
import 'package:http/http.dart' as http;

int i;
List<Estado> estados = [];

Future fetch(state) async {
  final res = await http.get(
      'https://covid19-brazil-api.now.sh/api/report/v1/brazil/uf/' + state);
  if (res.statusCode == 200) {
    String st = res.body;
    Estado e = Estado.fromJson(jsonDecode(st));
    estados.add(e);
  }
}

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

List<String> siglas = [
  "sp",
  "ce",
  "rj",
  "pa",
  "ba",
  "ma",
  "am",
  "pe",
  "df",
  "mg",
  "es",
  "pb",
  "al",
  "sc",
  "rn",
  "pr",
  "rs",
  "go",
  "se",
  "ap",
  "pi",
  "ro",
  "mt",
  "rr",
  "ac",
  "to",
  "ms",
];

Future init() async {
  for (var i = 0; i < siglas.length; i++) {
    await fetch(siglas[i]);
  }
}
