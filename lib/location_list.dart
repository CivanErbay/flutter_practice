import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/location_detail.dart';
import 'models/location.dart';
import 'styles.dart';

class LocationList extends StatefulWidget {
  @override
  createState() => _LocationListState();
}

// It has an underscore "_" because this class wont be available outside this file
class _LocationListState extends State<LocationList> {
  List<Location> locations = [];
  bool isLoading = false;

  //We just want to call loadData once
  @override
  void initState() {
    // super is representing what we extends/the parent class .. so its representing the "State"-Class
    super.initState();
    loadData();
  }

  //Constructor: Here we are specifing the location meaning whatever we pass in the parameter is going to be stored in the (final) location variable
  // UPDATE: We removed the constructor because we dont need it anymore for a stateful widget
  // LocationList(this.locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Locations", style: Styles.navBarTitle)),
        // Since we use a column we need as much space as possible in order to expand it
        // In order to do that there is a widget called "Expanded" and it will span in the whole column
        // Refreshindicator is the pull thingi if you want to refresh the page
        body: RefreshIndicator(
            onRefresh: loadData,
            child: Column(children: [
              renderProgressBar(context),
              Expanded(child: renderListView(context))
            ])));
  }

  Future<void> loadData() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
      final locations = await Location.fetchAll();
      //setState is a closure here
      setState(() {
        //Anything that is inside of setState will be call the build function of the class here
        this.locations = locations;
        isLoading = false;
      });
    }
  }

  Widget renderProgressBar(BuildContext context) {
    return (isLoading
        ? LinearProgressIndicator(
            value: null,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          )
        : Container());
  }

  Widget renderListView(BuildContext context) {
    return ListView.builder(
        // Why itemCount? We need to ahead of time how many items we have in our list .. If we want an infinite list we use another builder
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return _listTile(context, index);
        });
  }

  Widget _listTile(BuildContext context, int index) {
    final location = locations[index];
    // ListTile is one of many possible widgets that we can use here. It offers a leading and a trailing icon and a title and a centered content
    return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: _itemThumbnail(location),
        title: _itemTitle(location),
        //onTap takes a callback function as an argument, without no parameters and it returns always void
        onTap: () {
          _navigateToLocationDetail(context, location.id);
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
    return Text('${location.name}', style: Styles.textDefault);
  }
}
