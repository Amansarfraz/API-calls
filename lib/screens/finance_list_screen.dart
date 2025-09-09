import 'package:flutter/material.dart';
import '../services/api_service.dart';

class FinanceListScreen extends StatefulWidget {
  const FinanceListScreen({super.key});

  @override
  State<FinanceListScreen> createState() => _FinanceListScreenState();
}

class _FinanceListScreenState extends State<FinanceListScreen> {
  final ApiService apiService = ApiService();
  Future<List<dynamic>>? financeData;

  @override
  void initState() {
    super.initState();
    financeData = apiService.fetchFinanceData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Finance Tracker (Dummy API)")),
      body: FutureBuilder<List<dynamic>>(
        future: financeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data found"));
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final post = data[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(post['title']),
                    subtitle: Text(post['body']),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
