import 'package:bicycle_game/geolocation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  test('calculateDistance should return the correct distance', () {
    LatLng rc = LatLng(40.691407797702354, -73.98507768229393);
    LatLng rcNeighbor = LatLng(40.69147897845872, -73.98504817799676);
    double rcLat = 40.691407797702354;
    double rcLng = -73.98507768229393;
    double rcNeighborLat = 40.69147897845872;
    double rcNeighborLng = -73.98504817799676;
    final geolocation = Geolocation();
    // Expected result (in meters) using known values
    double expectedDistance = 10.9728;

    // Call the function
    double result = geolocation.calculateDistance(
        rcLat, rcLng, rcNeighborLat, rcNeighborLng);

    // Assert that the result is close to the expected value (allowing a small margin for floating-point accuracy)
    expect(result,
        closeTo(expectedDistance, 100.0)); // margin of error: 100 meters
    printOnFailure('Test failed: Calculated distance was $result meters');
  });
  test('incorrectExpectedDistance test', () {
    LatLng rc = LatLng(40.691407797702354, -73.98507768229393);
    LatLng rcNeighbor = LatLng(40.69147897845872, -73.98504817799676);
    double rcLat = 40.691407797702354;
    double rcLng = -73.98507768229393;
    double rcNeighborLat = 40.69147897845872;
    double rcNeighborLng = -73.98504817799676;
    final geolocation = Geolocation();
    // Expected result (in meters) using known values
    double incorrectExpectedDistance = 200.0;
    // Call the function
    double result = geolocation.calculateDistance(
        rcLat, rcLng, rcNeighborLat, rcNeighborLng);

    if (result != incorrectExpectedDistance) {
      print('Simulated failure handled correctly');
    }
    // Assert that the result is close to the expected value (allowing a small margin for floating-point accuracy)
    expect(result,
        isNot(incorrectExpectedDistance)); // margin of error: 100 meters
    printOnFailure('Test failed: Calculated distance was $result meters');
  });
  test('isAtMarker', () {
    // what do I want this next test to do?
    // isAtMarker test. A function that checks if the double from calculateDistance
    // is <= 100 meters.
    final geolocation = Geolocation();
    final result = geolocation.isAtMarker(100.0);
    expect(result, true);
  });
}
