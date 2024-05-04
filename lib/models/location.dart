// We create a model here where we can instantiate Location objects from
//Final keyword: means that the variable cannot be reassigned - once its defined its defined
// Location constructor is the thing that creates instance of the class and we are passing the parameters (which are the variables)
// whenever you "this"-Keyword its referring to the members of that class (name, url, facts..)
// The curly braces inside of the constructor functions means that the parameters are optional
import 'location_fact.dart';

class Location {
  final String name;
  final String url;
  final List<LocationFact> facts;
  Location({required this.name, required this.url, required this.facts});
}
