import 'package:exchange_rates/core/resource/colors.dart';
import 'package:exchange_rates/domain/entities/rate_data.dart';
import 'package:flutter/material.dart';

class ItemRate extends StatelessWidget {
  final RateData rate;
  final bool isLast;

  const ItemRate({
    Key? key,
    required this.rate,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
        borderRadius: isLast
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )
            : null,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/${rate.code.toLowerCase()}.png',
                  width: 50,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rate.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${rate.value.toStringAsFixed(2)} RUB",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  rate.rate.abs().toStringAsFixed(2),
                  style: TextStyle(
                    color: rate.rate > 0 ? Colors.green : Colors.red,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  rate.rate > 0
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 16,
                  color: rate.rate > 0 ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 16),
                const Icon(Icons.area_chart, color: blue),
              ],
            ),
          ),
          if (!isLast) const Divider(height: 1, color: Colors.grey),
        ],
      ),
    );
  }
}
