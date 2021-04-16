import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import '../Fluttermap/flutter_map_marker_popup.dart';
import '../Connection/connection.dart';

int curr_index;

List<LatLng> getList() {
  List<LatLng> ret = [];
  for (var i = 0; i < countries.length; i++) {
    ret.add(LatLng(countries[i].latitude, countries[i].longitude));
  }
  return ret;
}

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
  static final List<LatLng> _points = getList();

  static const _markerSize = 40.0;
  List<Marker> _markers;

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
        center: _points[230],
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
              countries[curr_index].location,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Text(
              "Cases: ${countries[curr_index].confirmed.toString()}",
              style: const TextStyle(fontSize: 12.0),
            ),
            Text(
              "Deaths: ${countries[curr_index].dead.toString()}",
              style: const TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
