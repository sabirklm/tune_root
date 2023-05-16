import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tuneroot_application/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group("drawer item click test", () {
    testWidgets('home item click test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));
      var buttonpress = find.byKey(const Key('home-drawer-key'));
      //await tester.ensureVisible(find.byKey(const Key('home-drawer-key')));
      await tester.pumpAndSettle(const Duration(seconds: 4));
      await tester.tap(buttonpress);
      await tester.pumpAndSettle(const Duration(seconds: 40));
    });
    testWidgets('search item click test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));
      var buttonpress = find.byKey(const Key('search-drawer-key'));
      await tester.ensureVisible(find.byKey(const Key('home-drawer-key')));
      await tester.pumpAndSettle(const Duration(seconds: 30));
      await tester.tap(buttonpress);
      await tester.pumpAndSettle(const Duration(seconds: 30));
    });
  });
}
