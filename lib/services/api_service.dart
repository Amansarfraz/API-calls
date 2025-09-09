import 'package:dio/dio.dart';
import '../model/finance.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<ExchangeRates> fetchExchangeRates({String base = 'USD'}) async {
    final url = 'https://randomuser.me/api/?results=10';
    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      return ExchangeRates.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }
}
