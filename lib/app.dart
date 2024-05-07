import 'package:flutter/material.dart';
// import 'mocks/mock_location.dart';
// import 'models/location.dart';
import 'location_list.dart';

//TODO Every time Models change (like different fields) do this command to auto-generate new code - What is this gonna does? Its scanning the project and create files that I want to import as part inside the models: "flutter packages pub run build_runner build"
// Why do we need this? In order to serialize a JSON object and create an actual instance of an location object.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final List<Location> mockLocations = MockLocation.FetchAll();
    return MaterialApp(home: LocationList());
  }
} 