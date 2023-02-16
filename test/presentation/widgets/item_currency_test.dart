import 'package:exchange_rates/presentation/widgets/base_currency.dart';
import 'package:exchange_rates/presentation/widgets/favorite_widget.dart';
import 'package:exchange_rates/presentation/widgets/item_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../domain/repositories/currency_repository_test.dart';

void main() {
  testWidgets("item currency", (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: ItemCurrency(currency: mockCurrency.first, isFavorite: false),
      ),
    );
    await widgetTester.pump();
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(2));
    expect(find.byType(FavoriteWidget), findsNothing);
  });

  testWidgets("item currency with favorite", (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: ItemCurrency(currency: mockCurrency.first, isFavorite: true),
      ),
    );
    await widgetTester.pump();
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(2));
    expect(find.byType(FavoriteWidget), findsOneWidget);
  });
}
