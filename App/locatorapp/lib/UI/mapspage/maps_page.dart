import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geocoder/geocoder.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  //TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  List<Marker> allMarkers = [];

  setMarkers() {
    return allMarkers;
  }

  addToList() async {
    final query = "206 Basden Avenue";
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    setState(() {
      allMarkers.add(new Marker(
          width: 45.0,
          height: 45.0,
          point: new LatLng(
              first.coordinates.latitude, first.coordinates.longitude),
          builder: (context) => new Container(
                child: IconButton(
                  icon: Icon(Icons.location_on),
                  color: Colors.blue,
                  iconSize: 45.0,
                  onPressed: () {
                    print(first.featureName);
                  },
                ),
              )));
    });
  }

  Future addMarker() async {
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text(
              'Add Marker',
              style: new TextStyle(fontSize: 17.0),
            ),
            children: <Widget>[
              new SimpleDialogOption(
                child: new Text('Show location on Map',
                    style: new TextStyle(color: Colors.blue)),
                onPressed: () {
                  addToList();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // maps page
      child: new Scaffold(
        bottomNavigationBar:
            new IconButton(icon: Icon(Icons.add), onPressed: addMarker),
        body: FlutterMap(
            options: new MapOptions(
                center: new LatLng(-25.83, 28.19), minZoom: 10.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(markers: setMarkers())
            ]),
      ),
    );
  }
}
