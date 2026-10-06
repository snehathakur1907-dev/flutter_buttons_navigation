import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_buttons_navigation/main.dart';

void main() {
  testWidgets('Flutter Buttons & Navigation app loads',
          (WidgetTester tester) async {
        await tester.pumpWidget(const ButtonsNavigationApp());

        expect(find.text('Flutter Buttons'), findsOneWidget);
        expect(find.text('Login'), findsOneWidget);
      });
}