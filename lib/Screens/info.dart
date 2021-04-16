import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String brazilApi = 'https://covid19-brazil-api.now.sh/';
String trackCorona = 'https://www.trackcorona.live';
String thunderforest = 'https://www.thunderforest.com/';
String github = 'https://github.com/jonh14lk/CovidBR';

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class InfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF1b1e44),
              Color(0xFF2d3447),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'References',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Calibre-Semibold",
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                  ),
                ),
                OutlineButton(
                  onPressed: () => { 
                    _launchURL(brazilApi)
                  },
                  child: Text('COVID-19 Brazil API'),
                  textColor: Colors.white,
                ),
                OutlineButton(
                  onPressed: () => {
                    _launchURL(trackCorona)
                  },
                  child: Text('TrackCorona Live'),
                  textColor: Colors.white,
                ),
                Text(
                  'Map theme',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Calibre-Semibold",
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                  ),
                ),
                OutlineButton(
                  onPressed: () => {
                    _launchURL(thunderforest)
                  },
                  child: Text('Thunderforest'),
                  textColor: Colors.white,
                ),
                Text(
                  'Github repository',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Calibre-Semibold",
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                  ),
                ),
                OutlineButton(
                  onPressed: () => {
                    _launchURL(github)
                  },
                  child: Text('Github'),
                  textColor: Colors.white,
                ),
              ],
            ),
        ),
      ),
    );
  }
}
