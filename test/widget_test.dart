
import 'package:flutter_test/flutter_test.dart';
import 'package:mindcare/main.dart';
import 'package:mindcare/games/memory_match/memory_match.dart';

void main() {
  testWidgets('MindCare app loads Memory Match game',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MemoryMatchGame), findsOneWidget);
  });
}
