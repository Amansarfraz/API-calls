import 'package:flutter/material.dart';

class FinanceDetailScreen extends StatelessWidget {
  final String currency;
  final String rate;
  final String base;
  final String date;

  const FinanceDetailScreen({
    super.key,
    required this.currency,
    required this.rate,
    required this.base,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$currency Details")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Base Currency: $base", style: const TextStyle(fontSize: 18)),
            Text(
              "Target Currency: $currency",
              style: const TextStyle(fontSize: 18),
            ),
            Text("Exchange Rate: $rate", style: const TextStyle(fontSize: 18)),
            Text("Date: $date", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
