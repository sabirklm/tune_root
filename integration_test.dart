import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tuneroot_application/main.dart' as app; //importing main as app

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group("drawer item click test", () {
    testWidgets('home item click test', (WidgetTester tester) async {
      app.main(); // inisalizing main

     // await tester.pump(const Duration(seconds: 10)); //wiating for 10second
      Finder buttonpress = find
          .byKey(const Key('PRESS')); // find widget by - key,type,tooltip...
      await tester.ensureVisible(find.byKey(const Key('PRESS'))); //find the key
      await tester.tap(buttonpress); // pressing key
    });
  });
}
