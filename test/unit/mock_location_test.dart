import 'package:flutter_application_1/mocks/mock_location.dart';
import 'package:test/test.dart';

// Every test has a main function, because you run this fle as it is
// And it also has this test-method provided by the test package
void main() {
  test('test fetchAny', () {
    final mockLocation = MockLocation.FetchAny();
    expect(mockLocation, isNotNull);
    expect(mockLocation.name, isNotEmpty);
  });

  test('test fetchAll', () {
    final mockLocations = MockLocation.FetchAll();
    expect(mockLocations.length, greaterThan(0));
    expect(mockLocations[0].name, isNotEmpty);
  });

  test('test fetch', () {
    final mockLocation = MockLocation.fetch(0);
    expect(mockLocation, isNotNull);
    expect(mockLocation.name, isNotEmpty);
  });
}
