import 'package:google_maps_flutter/google_maps_flutter.dart';

class User {
  String id;
  double latitude;
  double longitude;

  User({required this.id, required this.latitude, required this.longitude});

  void updateLocation(double lat, double lng) {
      latitude = lat; 
      longitude = lng;
  }
}