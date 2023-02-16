import 'package:exchange_rates/presentation/widgets/item_rate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../domain/repositories/currency_repository_test.dart';

void main() {
  testWidgets("item rate", (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: ItemRate(rate: mockRates.first, isLast: false),
      ),
    );
    await widgetTester.pump();
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(3));
    expect(find.byType(Icon), findsNWidgets(2));
    expect(find.byType(Divider), findsOneWidget);
  });

  testWidgets("item rate last", (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: ItemRate(rate: mockRates.first, isLast: true),
      ),
    );
    await widgetTester.pump();
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(3));
    expect(find.byType(Icon), findsNWidgets(2));
    expect(find.byType(Divider), findsNothing);
  });
}
