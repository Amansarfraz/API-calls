import 'package:flutter/material.dart';
import '../model/finance.dart';

class FinanceDetailScreen extends StatelessWidget {
  final Finance finance;

  const FinanceDetailScreen({super.key, required this.finance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(finance.code)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Currency: ${finance.code}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Rate: ${finance.rate}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              "Description: ${finance.description}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
