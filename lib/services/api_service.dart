import 'package:dio/dio.dart';
import '../model/user_response.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<UserResponse> fetchUsers(int count) async {
    try {
      // ✅ Use proxy for Chrome (CORS issue bypass)
      const String url =
          "https://cors-anywhere.herokuapp.com/https://randomuser.me/api/?results=";

      final response = await _dio.get("$url$count");

      return UserResponse.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Failed to load users: $e");
    }
  }
}
