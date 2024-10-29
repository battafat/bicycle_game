import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// calculateDistance formula is from this website:
// https://medium.com/nerd-for-tech/find-out-the-radius-between-two-location-points-in-flutter-9416fe2b3afa
class Geolocation {
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    final resKM = 12742 * asin(sqrt(a));
    final resMeters = resKM * 1000;
    return resMeters;
  }

  bool isAtMarker(double distance) {
    return distance <= 100;
  }

  double calculateDistanceFromMarker(Marker marker, Position userLocation) {
    marker.position;
    final fake = 100.0;
    return fake;
  }
  // TODO: write getLatLng
  // calculateDistanceFromEachMarker(){

  // }
}

// distance will be in meters.
// let's say when it's less than 100 meters (I think that's as close an accurary as you can guarantee with geolocator plugin in Android.)

// isAtMarker {if calculateDistance < 100 return true}
// if isAtMarker, show popup
// if you click the popup, it takes you to the AR screen.
// maybe there could be a switch statement to switch you between the different AR images
// TODO: create calulate distance
// create popup if you're near the location

class MarkerManager {

  final Map<String, Marker> markersByName = {
    'rcMarker': Marker(
      markerId: MarkerId('Recurse Center'),
      position: LatLng(40.69155664982435, -73.98506900344982),
      infoWindow: InfoWindow(
        title: "Recurse Center",
        snippet: "Starting point for the game",
      ), // InfoWindow
    ),
    'rcNeighbor': Marker(
      markerId: MarkerId('rcNeighbor'),
      position: LatLng(40.69147897845872, -73.98504817799676),
      infoWindow: InfoWindow(
        title: "393 Bridge St.",
        snippet: "north neighbor of RC",
      ), // InfoWindow
    )
  };

  LatLng getMarkerPosition(String markerName) {
    var marker = markersByName[markerName];
    if (marker?.position != null) {
      return marker!.position;
    } else {
      // TODO: make this a log later?
      print("Marker position is null for $markerName, using default position.");
      return LatLng(40.69155664982435, -73.98506900344982); // Define a default position as a fallback
    }
}
}