import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';

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
class LocationDetail extends StatelessWidget {
  final Location location;

  //Constructor: Here we are specifing the location meaning whatever we pass in the parameter is going to be stored in the (final) location variable
  LocationDetail(this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(location.name, style: Styles.navBarTitle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, location),
          // children: [
          //   _section("One", Colors.yellow),
          //   _section("Two", Colors.green),
          //   _section("Three", Colors.red),
          // ]),
        ));
  }

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
      child: Image.network(url, fit: BoxFit.fitWidth),
    );
  }
}
