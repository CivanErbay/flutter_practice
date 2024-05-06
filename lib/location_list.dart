import 'package:flutter/material.dart';
import 'package:flutter_application_1/location_detail.dart';
import 'models/location.dart';
import 'styles.dart';


class LocationList extends StatelessWidget {
  final List<Location> locations;

  //Constructor: Here we are specifing the location meaning whatever we pass in the parameter is going to be stored in the (final) location variable
  LocationList(this.locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Locations", style: Styles.navBarTitle)),
        body: ListView.builder(
            // Why itemCount? We need to ahead of time how many items we have in our list .. If we want an infinite list we use another builder
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return _listTile(context, index);
            }));
  }

  Widget _listTile(BuildContext context, int index) {
    // ListTile is one of many possible widgets that we can use here. It offers a leading and a trailing icon and a title and a centered content
    return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: _itemThumbnail(locations[index]),
        title: _itemTitle(locations[index]),
        //onTap takes a callback function as an argument, without no parameters and it returns always void
        onTap: () {
          _navigateToLocationDetail(context, index);
        });
  }

  void _navigateToLocationDetail(BuildContext context, int locationId) {
    // click to print location
    // print(">>> ${locations[index].name}");
    // Navigator works like a stack - its pushing "elements" on the stack (which is like a deck of cards)
    // MaterialPageRoute is a class that takes a builder as an argument. The builder defines the contents of that page/route
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationDetail(locationId)));
  }

  // All these "rendering helper methods" they are always going to return a widget
  Widget _itemThumbnail(Location location) {
    print(location.url);
    return Container(
        constraints: BoxConstraints.tightFor(width: 100.0),
        child: Image.network(
          location.url,
          fit: BoxFit.fitWidth,
          errorBuilder: (context, error, stackTrace) {
            // Return an error widget if image loading fails
            return Icon(Icons.error);
          },
        ));
  }

  Widget _itemTitle(Location location) {
    //return Text(location.name, style: Styles.textDefault);
    // String interpolaton if you want to add something to a string
    return Text('${location.name}',
        style: Styles.textDefault);
  }
}
