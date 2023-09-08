import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1st step
  static final CameraPosition _kGooglePlex =
      const CameraPosition(target: LatLng(24.98263, 67.08073), zoom: 14);

  // 2nd step
  Completer<GoogleMapController> _controller = Completer();

  // 3rd step
  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(24.98263, 67.08073),
        infoWindow: InfoWindow(title: "Ismail Mughal House")),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(24.97765, 67.08012),
        infoWindow: InfoWindow(title: "Muhammad Mughal House")),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(33.6844, 73.0479),
      infoWindow: InfoWindow(title: "Asif Taj House"),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          markers: Set<Marker>.of(_marker),
          mapType: MapType.satellite,
          myLocationEnabled: false,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Searching your location",
          child: Icon(Icons.location_searching_sharp),
          onPressed: () async {
            GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target: LatLng(33.6844, 73.0479), zoom: 14)));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
