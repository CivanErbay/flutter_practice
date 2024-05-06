import 'package:flutter/material.dart';
import 'mocks/mock_location.dart';
import 'models/location.dart';
import 'location_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Location> mockLocations = MockLocation.FetchAll();
    return MaterialApp(home: LocationList(mockLocations));
  }
}
