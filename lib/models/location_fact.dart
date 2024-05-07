import 'package:json_annotation/json_annotation.dart';

part 'location_fact.g.dart';

//This annotation makes the code/class serializable - important for this command "dart run build_runner build"
@JsonSerializable()
class LocationFact {
  final String title;
  final String text;
  LocationFact({required this.title, required this.text});

  factory LocationFact.fromJson(Map<String, dynamic> json) =>
      _$LocationFactFromJson(json);
}
