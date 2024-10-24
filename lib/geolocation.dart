
import 'dart:math';
// calculateDistance formulate is from this website:
// https://medium.com/nerd-for-tech/find-out-the-radius-between-two-location-points-in-flutter-9416fe2b3afa
class Geolocation{
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
  bool isAtMarker(double distance){
    return distance <= 100;
  }
}

// distance will be in meters. 
// let's say when it's less than 100 meters (I think that's as close an accurary as you can guarantee with geolocator plugin in Android.)

// isAtMarker {if calculateDistance < 100 return true}
// if isAtMarker, show popup
// if you click the popup, it takes you to the AR screen. 
// maybe there could be a switch statement to switch you between the different AR images
// TODO: create calulate distance 
// create popup if you're near the location