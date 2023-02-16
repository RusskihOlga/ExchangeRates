import 'package:flutter/material.dart';

class EditCurrency extends StatelessWidget {
  final String code;
  final double value;
  final String codeConvert;

  const EditCurrency({
    Key? key,
    required this.codeConvert,
    required this.code,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/${code.toLowerCase()}.png',
          width: 50,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                code,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "1 $code = ${value.toStringAsFixed(value < 1 ? 4 : 2)} $codeConvert",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
