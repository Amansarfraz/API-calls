import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;
  final List<User> data;

  UserResponse({
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
