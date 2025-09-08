import 'package:dio/dio.dart';
import '../models/user_response.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://your-api.com'; // Replace with your API

  Future<UserResponse> getUsers() async {
    try {
      final response = await _dio.get('$baseUrl/users');
      return UserResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }

  Future<UserResponse> addUser(Map<String, dynamic> userData) async {
    try {
      final response = await _dio.post('$baseUrl/users', data: userData);
      return UserResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to add user: $e');
    }
  }
}
