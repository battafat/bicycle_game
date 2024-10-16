import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _stinsonPark = const LatLng(41.23801512899556, -96.01647066329785);


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _stinsonPark,
            zoom: 0.0,
          ),
        markers: {
            const Marker(
              markerId: MarkerId('stinsonPark'),
              position: LatLng(41.23801512899556, -96.01647066329785),
              infoWindow: InfoWindow(
                title: "stinsonPark",
                snippet: "Starting point for the game",
              ), // InfoWindow
            )
          },  
        ),
        
      ),
    );
  }
}
