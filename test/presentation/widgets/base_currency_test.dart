import 'package:exchange_rates/presentation/widgets/base_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("base currency", (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: BaseCurrency(code: "USD", title: "Доллар США"),
      ),
    );
    await widgetTester.pump();
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(3));
  });
}
