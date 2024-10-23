// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bicycle_game/main.dart';

void main() {
  testWidgets('test for Map build', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.byWidget(GoogleMap(
            initialCameraPosition: CameraPosition(
          target: LatLng(41.23801512899556, -96.01647066329785)
        ))), findsOneWidget);
    
    // Future tests:
    // test if the button exists on the map
    // test if the latLng was input. 
    // if someone inputs bad data, do we want to check on how it gracefully handles that
    // test if the application displays the response
    // what happens if the API is down?
    // how does the app handle that?


    
  });
}
