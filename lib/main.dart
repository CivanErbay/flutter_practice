import 'package:flutter/material.dart';
import 'mocks/mock_location.dart';
import 'models/location.dart';
import 'location_list.dart';

//Home is the entry point of the app
//Container is extremely flexibel and useful, like "div" in html
//decoration property to specify background or styling stuff - its a parameter we are passing to the container constructor
// Boxdecoration is a specific type of decoration - color parameter of this is the background color
// Colors.XXX is refering to prefixed dart values
// Child is whatever wigdet that is inside the container
// Important to note: Container is only occupying the space it needs --> Its not gonna stretch by default (like a div in html also doing this)
// MainAxisAlignment and CrossAxisAlignment are used to align the widgets inside the container
// MainAxisAlignment.start is the default for column, CrossAxisAlignment.stretch is gonna stretch each of these boxes from left to right
void main() {
  //final Location mockLocation = MockLocation.FetchAny();
  final List<Location> mockLocations = MockLocation.FetchAll();
  //return runApp(MaterialApp(home: LocationDetail(mockLocation)));
  return runApp(MaterialApp(home: LocationList(mockLocations)));
}
