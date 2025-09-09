import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final List<User>? results;

  UserResponse({this.results});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
