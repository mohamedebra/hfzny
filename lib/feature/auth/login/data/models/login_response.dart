import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? token;
  UserData? user;

  LoginResponse({this.token, this.user, });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {

  int? id;
  int? phone;
  String? name;
  String? email;
  String? email_verified_at;
  String? avatar;
  String? gender;
  String? created_at;
  String? updated_at;
  int? role_id;

  UserData({this.id,this.phone,this.role_id,this.avatar,this.created_at,this.email,this.email_verified_at,this.gender,this.name,this.updated_at});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

