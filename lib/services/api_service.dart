import 'package:dio/dio.dart';
import '../model/finance.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Finance>> fetchFinanceData() async {
    try {
      final response = await _dio.get(
        'https://api.coindesk.com/v1/bpi/currentprice.json',
      );

      if (response.statusCode == 200) {
        final data = response.data['bpi'] as Map<String, dynamic>;
        List<Finance> financeList = [];

        data.forEach((key, value) {
          financeList.add(Finance.fromJson(value));
        });

        return financeList;
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
