import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'flutter_map_marker_popup.dart';
import 'api.dart';

int curr_index;

class MapWidget extends StatelessWidget {
  final GlobalKey<_MapPageState> _mapPageStateKey = GlobalKey<_MapPageState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MapPage(_mapPageStateKey),
        builder: (context, navigator) {
          return Scaffold(
            body: navigator,
          );
        });
  }
}

class MapPage extends StatefulWidget {
  MapPage(GlobalKey<_MapPageState> key) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static final List<LatLng> _points = [
    LatLng(-23.55, -46.64),
    LatLng(-3.71, -38.54),
    LatLng(-22.84, -43.15),
    LatLng(-5.53, -52.29),
    LatLng(-12.96, -38.51),
    LatLng(-2.55, -44.30),
    LatLng(-3.07, -61.66),
    LatLng(-8.28, -35.07),
    LatLng(-15.83, -47.86),
    LatLng(-18.10, -44.38),
    LatLng(-19.19, -40.34),
    LatLng(-7.06, -35.55),
    LatLng(-9.71, -35.73),
    LatLng(-27.33, -49.44),
    LatLng(-5.22, -36.52),
    LatLng(-24.89, -51.55),
    LatLng(-30.01, -51.22),
    LatLng(-16.64, -49.31),
    LatLng(-10.90, -37.07),
    LatLng(1.41, -51.77),
    LatLng(-8.28, -43.68),
    LatLng(-11.22, -62.80),
    LatLng(-12.64, -55.42),
    LatLng(1.89, -61.22),
    LatLng(-8.77, -70.55),
    LatLng(-10.25, -48.25),
    LatLng(-20.51, -54.54),
  ];

  static const _markerSize = 40.0;
  List<Marker> _markers;

  // Used to trigger showing/hiding of popups.
  final PopupController _popupLayerController = PopupController();

  @override
  void initState() {
    super.initState();

    _markers = _points
        .map(
          (LatLng point) => Marker(
            point: point,
            width: _markerSize,
            height: _markerSize,
            builder: (_) => Icon(Icons.location_on, size: _markerSize),
            anchorPos: AnchorPos.align(AnchorAlign.top),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: new MapOptions(
        zoom: 5.0,
        center: _points.first,
        plugins: [PopupMarkerPlugin()],
        onTap: (_) => _popupLayerController.hidePopup(),
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              'https://{s}.tile.thunderforest.com/transport-dark/{z}/{x}/{y}.png?apikey=8636d0600eb043cb9d07a29ca9beca1d',
          subdomains: ['a', 'b', 'c'],
        ),
        PopupMarkerLayerOptions(
          markers: _markers,
          popupSnap: PopupSnap.top,
          popupController: _popupLayerController,
          popupBuilder: (BuildContext _, Marker marker) => ExamplePopup(marker),
        ),
      ],
    );
  }

  void showPopupForFirstMarker() {
    _popupLayerController.togglePopup(_markers.first);
  }
}

int find_index(LatLng at) {
  for (var i = 0; i < _MapPageState._points.length; i++) {
    if (at == _MapPageState._points[i]) return i;
  }
  return -1;
}

class ExamplePopup extends StatefulWidget {
  final Marker marker;

  ExamplePopup(this.marker, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExamplePopupState(this.marker);
}

class _ExamplePopupState extends State<ExamplePopup> {
  final Marker _marker;

  _ExamplePopupState(this._marker);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
            ),
            _cardDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _cardDescription(BuildContext context) {
    curr_index = find_index(_marker.point);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              estados[curr_index].state,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Text(
              "Casos: ${estados[curr_index].cases.toString()}",
              style: const TextStyle(fontSize: 12.0),
            ),
            Text(
              "Mortes: ${estados[curr_index].deaths.toString()}",
              style: const TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
