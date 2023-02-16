import 'package:exchange_rates/domain/entities/currency_data.dart';
import 'package:exchange_rates/presentation/widgets/favorite_widget.dart';
import 'package:flutter/material.dart';

class ItemCurrency extends StatelessWidget {
  final CurrencyData currency;
  final bool isFavorite;

  const ItemCurrency({
    Key? key,
    required this.currency,
    this.isFavorite = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/${currency.code.toLowerCase()}.png',
                    width: 50,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currency.code,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          currency.name,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isFavorite)
              FavoriteWidget(code: currency.code, status: currency.favorite),
          ],
        ),
      ),
    );
  }
}
