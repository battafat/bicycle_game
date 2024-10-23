import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logging/logging.dart';



void main() {
  // Configure logging
  Logger.root.level = Level.ALL; // Show all logs
  Logger.root.onRecord.listen((record) {
    print('*** LOG: ${record.level.name} | ${record.time} | ${record.message} ***');
  });
  
  // Start the app
  runApp(const MyApp());
}

final Logger _logger = Logger('PositionLogger');

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;
  
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }


final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.high,
  distanceFilter: 100,
);

void logPosition() async{
  try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);

      _logger.info('Latitude: ${position.latitude}');
      _logger.info('Longitude: ${position.longitude}');
  } catch (e) {
      _logger.severe('Failed to get current position: $e');
    }
}
  

  final LatLng _stinsonPark =
      const LatLng(41.23801512899556, -96.01647066329785);
  final LatLng _paris = const LatLng(48.8575, 2.3514);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    logPosition();
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
            target: _paris,
            zoom: 11.0,
          ),
          markers: {
            const Marker(
              markerId: MarkerId('Recurse Center'),
              position: LatLng(40.69155664982435, -73.98506900344982),
              infoWindow: InfoWindow(
                title: "Recurse Center",
                snippet: "Starting point for the game",
              ), // InfoWindow
            ),
            
          },
        ),
      ),
    );
  }
}
