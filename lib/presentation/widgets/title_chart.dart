import 'package:exchange_rates/core/resource/colors.dart';
import 'package:flutter/material.dart';

class TitleChart extends StatelessWidget {
  final double value;
  final String code;
  final String title;

  const TitleChart({
    Key? key,
    required this.value,
    required this.code,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1 $code",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.compare_arrows, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            "${value.toStringAsFixed(2)} RUB",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
