import 'package:flutter_application_1/mocks/mock_location.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/app.dart';

void main() {
  testWidgets('test app startup', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    final mockLocation = MockLocation.FetchAny();

    expect(find.text(mockLocation.name), findsOneWidget);
    expect(find.text('${mockLocation.name}blah'), findsNothing);
  });
}
