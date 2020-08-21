import 'package:flutter/widgets.dart';
import 'package:flutter_map/plugin_api.dart';
import 'popup_marker_layer.dart';
import 'popup_marker_layer_options.dart';

class PopupMarkerPlugin extends MapPlugin {
  @override
  Widget createLayer(
      LayerOptions options, MapState mapState, Stream<void> stream) {
    return PopupMarkerLayer(options, mapState, stream);
  }

  @override
  bool supportsLayer(LayerOptions options) {
    return options is PopupMarkerLayerOptions;
  }
}
