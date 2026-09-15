import 'package:flutter_test/flutter_test.dart';
import 'package:estetica_selva_landing/main.dart';

void main() {
  testWidgets('App smoke test loads Selva Estética', (WidgetTester tester) async {
    await tester.pumpWidget(const SelvaEsteticaApp());
    expect(find.text('SELVA'), findsWidgets);
  });
}
