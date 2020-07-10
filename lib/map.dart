import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapWidget extends StatelessWidget {
  MapWidget();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new FlutterMap(
            options: new MapOptions(
                minZoom: 10.0, center: new LatLng(-9.66, -35.73)),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(-9.66, -35.73),
                    builder: (context) => new Container(
                          child: IconButton(
                              icon: Icon(Icons.accessibility),
                              onPressed: () {
                                print('Marker tapped!');
                              }),
                        ))
              ])
            ])
      ],
    );
  }
}
