import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';
import 'mocks/mock_location.dart';

// Stateless widgets are effectively a class
// Extends means here: We take everything StatelessWidget offers and we adding our custom logic, functions, variables etc to it
//
// Was does "build"? In every widget, we have a build method
// If you are extending a StatelessWidget you need to override the build method. Build contains the logic so flutter can paint the screen.
// Build has a specific method footprint and its gonna return a widget
// When you override you have to use the specific input and output thats expected
// "Widget build" --> Widget is the return type
// Remember: Whenever you use build you have to pass a context

// STEP 2: Refactoring: The containers look pretty repetitive, so we gonna make a function to keep the code cleaner
// The method is going to return a section which is going to be a widget which is a Container
// The _ (underscore in front) is dart specific syntax showing that this is private method, meaning it can only be invoked inside this class

// Methods are in camelCase, classes are in PascalCase and filenames are in snake_case

// STEP 3: We need to able to pass in a parameter into this stateless widget
// The easiest way to do that is to specify a location .. we are specifing a member (like a variable). Its final because its not gonna change

// STEP 4: There is many ways to implement an image but we are going to use a container here because to stretch it as much as it can,
// but also to constrain its height to a specific amount of pixels

class LocationDetail extends StatefulWidget {
  final int locationId;

  LocationDetail(this.locationId);
  //By the time this executes we need to know what the locationId is, thats why we use the constructor in the state and we gonna save it in a member thats final here
  @override
  createState() => _LocationDetailState(locationId);
}

class _LocationDetailState extends State<LocationDetail> {
  final int locationId;
  //This is a way to retain the location that gets loaded in the constructor as a blanked out new instance
  Location location = Location.blank();

  //Constructor: Here we are specifing the location meaning whatever we pass in the parameter is going to be stored in the (final) location variable
  // UPDATE: This class still needs a constructor because when the state is first loaded/the class instance
  // is created it needs to know straight away what the location ID it needs to load is.
  _LocationDetailState(this.locationId);

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final location = await Location.fetchById(locationId);

    //if we call setState it will call out build function automatically. But we cant call our build method here if our widget is not yet mounted.
    if (mounted) {
      setState(() {
        this.location = location;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // In reality we here some sort of loading spinner until the location is loaded
    // Be careful what you do in build because it can slow down your app
    // var location = MockLocation.fetch(locationId);
    return Scaffold(
        appBar: AppBar(
          title: Text(location.name, style: Styles.navBarTitle),
        ),
        // SingleChildScrollView is a scrollable widget that only contains one child widget which allows to scroll the page if the content might overflow
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, location),
        )));
  }

  // loadData() async {
  //   final location =
  // }

  List<Widget> _renderBody(BuildContext context, Location location) {
    var result = <Widget>[];
    result.add(_bannerImage(location.url, 170.0));
    //.addAll is beceuase renderFacets returns a list of widgets
    result.addAll(_renderFacts(context, location));
    //print(result);
    return result;
  }

  List<Widget> _renderFacts(BuildContext context, Location location) {
    var result = <Widget>[]; //Returns a list of widgets
    for (int i = 0; i < location.facts.length; i++) {
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));
    }
    return result;
  }

  Widget _sectionTitle(String title) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
        child:
            Text(title, textAlign: TextAlign.left, style: Styles.headerLarge));
  }

  Widget _sectionText(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        child: Text(text, style: Styles.textDefault));
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      // Image.network is a "named" constructor
      child: Image.network(
        url,
        fit: BoxFit.fitWidth,
        errorBuilder: (context, error, stackTrace) {
          // Return an error widget if image loading fails
          return Icon(Icons.error);
        },
      ),
    );
  }
}
