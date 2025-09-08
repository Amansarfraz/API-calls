import 'package:dio/dio.dart';
import '../model/user_response.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://reqres.in/api/users?page=1",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<UserResponse> fetchUsers({int page = 1}) async {
    try {
      final response = await dio.get('/users', queryParameters: {"page": page});

      // Debugging ke liye raw API response print karna
      print("📢 API Status Code: ${response.statusCode}");
      print("📢 API Response: ${response.data}");

      if (response.statusCode == 200) {
        // Yaha parse kar rahe hain
        final userResponse = UserResponse.fromJson(response.data);
        print("✅ Parsed Users Count: ${userResponse.data.length}");
        return userResponse;
      } else {
        throw Exception("⚠️ Failed to load users: ${response.statusCode}");
      }
    } on DioException catch (dioError) {
      print("❌ Dio Error: ${dioError.message}");
      throw Exception("DioException: ${dioError.message}");
    } catch (e) {
      print("❌ Unknown Error: $e");
      throw Exception("Unknown error: $e");
    }
  }
}
