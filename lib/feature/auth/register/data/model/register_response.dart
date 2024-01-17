import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';
@JsonSerializable()
class RegisterResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  String? token;

  RegisterResponse({this.message, this.userData,  this.token});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
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
  String? role_id;

  UserData({this.id,this.phone,this.role_id,this.avatar,this.created_at,this.email,this.email_verified_at,this.gender,this.name,this.updated_at});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}