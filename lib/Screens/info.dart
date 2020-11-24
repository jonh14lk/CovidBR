import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL() async {
  const url = 'https://covid19-brazil-api.now.sh/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url = 'https://www.thunderforest.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url = 'https://github.com/jonh14lk';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  const url = 'https://www.trackcorona.live';
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
                  'APIs utilizadas',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Calibre-Semibold",
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                  ),
                ),
                OutlineButton(
                  onPressed: _launchURL,
                  child: Text('COVID-19 Brazil API'),
                  textColor: Colors.white,
                ),
                OutlineButton(
                  onPressed: _launchURL4,
                  child: Text('TrackCorona Live'),
                  textColor: Colors.white,
                ),
                Text(
                  'Tema do mapa',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Calibre-Semibold",
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                  ),
                ),
                OutlineButton(
                  onPressed: _launchURL2,
                  child: Text('Thunderforest'),
                  textColor: Colors.white,
                ),
                Text(
                  'Desenvolvedor do app',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Calibre-Semibold",
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                  ),
                ),
                OutlineButton(
                  onPressed: _launchURL3,
                  child: Text('Github'),
                  textColor: Colors.white,
                ),
              ]),
        ),
      ),
    );
  }
}
