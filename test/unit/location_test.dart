// import 'dart:convert';
import 'package:test/test.dart';
import 'package:flutter_application_1/models/location.dart';

void main() {
  test('test location deserialization', () async {
    final locations = await Location.fetchAll();
    for (var location in locations) {
      expect(location.name, hasLength((greaterThan(0))));
      expect(location.url, hasLength((greaterThan(0))));

      final fetchedLocation = await Location.fetchById(location.id);
      expect(fetchedLocation.name, equals(location.name));
      expect(fetchedLocation.url, equals(location.url));
      expect(fetchedLocation.facts, hasLength(location.facts.length));
    }
  });
}
