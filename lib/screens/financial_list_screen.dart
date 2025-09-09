import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../model/finance.dart';
import 'financial_detail_screen.dart';

class FinanceListScreen extends StatefulWidget {
  const FinanceListScreen({super.key});

  @override
  State<FinanceListScreen> createState() => _FinanceListScreenState();
}

class _FinanceListScreenState extends State<FinanceListScreen> {
  final ApiService _apiService = ApiService();
  Future<ExchangeRates>? _exchangeRates;

  @override
  void initState() {
    super.initState();
    _exchangeRates = _apiService.fetchExchangeRates(base: 'USD');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Finance Tracker")),
      body: FutureBuilder<ExchangeRates>(
        future: _exchangeRates,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          }

          final data = snapshot.data!;
          final rates = data.rates;

          return ListView.builder(
            itemCount: rates.length,
            itemBuilder: (context, index) {
              final currency = rates.keys.elementAt(index);
              final rate = rates[currency];

              return Card(
                child: ListTile(
                  title: Text(currency),
                  subtitle: Text("Rate: $rate"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FinanceDetailScreen(
                          currency: currency,
                          rate: rate.toString(),
                          base: data.base,
                          date: data.date,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
