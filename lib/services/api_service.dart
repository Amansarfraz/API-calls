import 'package:dio/dio.dart';
import '../model/user_response.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(baseUrl: "https://reqres.in/api"));

  Future<UserResponse> fetchUsers({int page = 1}) async {
    final response = await dio.get('/users', queryParameters: {"page": page});

    // Debugging ke liye response print karo
    print("API Response: ${response.data}");

    if (response.statusCode == 200) {
      return UserResponse.fromJson(response.data);
    } else {
      throw Exception("Failed to load users");
    }
  }
}
