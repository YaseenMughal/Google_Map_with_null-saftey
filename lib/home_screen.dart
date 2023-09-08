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
      const CameraPosition(target: LatLng(24.9838, 67.0602), zoom: 14);

  // 2nd step
  Completer<GoogleMapController> _controller = Completer();

  // 3rd step
  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(24.9838, 67.0602),
        infoWindow:
            InfoWindow(title: "National Cricket Stadium, Karachi-Pakistan")),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(31.5137, 74.3333),
        infoWindow:
            InfoWindow(title: "Gaddafi Cricket Stadium, Lahore-Pakistan")),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(23.092, 72.597),
      infoWindow: InfoWindow(
          title: "Narendra Modi Cricket Stadium, Ahmedabad-Gujarat-India"),
    ),
    Marker(
      markerId: MarkerId('4'),
      position: LatLng(12.978806, 77.599556),
      infoWindow:
          InfoWindow(title: "Chinnaswamy Cricket Stadium, Bangalore-India"),
    ),
    Marker(
      markerId: MarkerId('5'),
      position: LatLng(51.5298, 0.1722),
      infoWindow:
          InfoWindow(title: "Lord's Cricket Stadium, Birmingham-England"),
    ),
    Marker(
      markerId: MarkerId('6'),
      position: LatLng(52.4553, 1.9041),
      infoWindow:
          InfoWindow(title: "Edgbaston Cricket Stadium, Birmingham-England"),
    ),
    Marker(
      markerId: MarkerId('7'),
      position: LatLng(51.4838, 0.1150),
      infoWindow:
          InfoWindow(title: "The Oval Cricket Stadium, Birmingham-England"),
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
          mapType: MapType.terrain,
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
                CameraPosition(target: LatLng(51.5298, 0.1722), zoom: 14)));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
