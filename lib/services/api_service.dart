import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchFinanceData() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts',
      );

      if (response.statusCode == 200) {
        return response.data; // list of posts
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
