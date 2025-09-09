import 'package:dio/dio.dart';
import '../models/user_response.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> fetchUsers(int count) async {
    try {
      final response = await _dio.get(
        "https://randomuser.me/api/?results=$count",
      );
      return response.data.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to load users: $e");
    }
  }
}
