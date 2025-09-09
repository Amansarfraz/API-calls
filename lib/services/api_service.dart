import 'package:dio/dio.dart';
import '../model/user_response.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<UserResponse> fetchUsers(int count) async {
    try {
      final response = await _dio.get(
        "https://randomuser.me/api/?results=$count",
      );

      // response.data is Map<String, dynamic>
      return UserResponse.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Failed to load users: $e");
    }
  }
}
