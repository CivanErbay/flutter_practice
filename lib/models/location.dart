// We create a model here where we can instantiate Location objects from
//Final keyword: means that the variable cannot be reassigned - once its defined its defined
// Location constructor is the thing that creates instance of the class and we are passing the parameters (which are the variables)
// whenever you "this"-Keyword its referring to the members of that class (name, url, facts..)
// The curly braces inside of the constructor functions means that the parameters are optional
import 'location_fact.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:async'; // this is for async/await/Futures
import 'package:http/http.dart' as http;
import '../endpoint.dart';
import 'dart:convert';

// Part kinda take code from another file and use it in our class - 'location.g.dart' this is file that gets generated
part 'location.g.dart';

//This annotation makes the code/class serializable - important for this command "dart run build_runner build"
@JsonSerializable()
class Location {
  final int id;
  final String name;
  final String url;
  final List<LocationFact> facts;
  Location(
      {required this.id,
      required this.name,
      required this.url,
      required this.facts});

  //This is a named, custom constructor that instantiates an empty Location object with default values
  Location.blank()
      : id = 0,
        name = '',
        url = '',
        facts = [];

  // This is a factory constructor that creates an instance of Location from a JSON object
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  // In every model, if there is web service that relates to that model, we gonna implement that
  // Future is a promise-type that will be resolved in the future
  static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri('locations');

    //.get returns a type of "Response" that reprents a http response
    final resp = await http.get(uri);
    print(resp.body);
    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    List<Location> list = <Location>[];

    //Here we iterate over the response, decode it and create a list of Location objects
    for (var jsonItem in json.decode(resp.body)) {
      list.add(Location.fromJson(jsonItem));
    }
    return list;
  }

  static Future<Location> fetchById(int id) async {
    var uri = Endpoint.uri('locations/$id');

    //.get returns a type of "Response" that reprents a http response
    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    //Here we iterate over the response, decode it and create a list of Location objects
    final Map<String, dynamic> itemMap = json.decode(resp.body);
    return Location.fromJson(itemMap);
  }
}
