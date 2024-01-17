// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      message: json['message'] as String?,
      userData: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.userData,
      'token': instance.token,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as int?,
      phone: json['phone'] as int?,
      role_id: json['role_id'] as String?,
      avatar: json['avatar'] as String?,
      created_at: json['created_at'] as String?,
      email: json['email'] as String?,
      email_verified_at: json['email_verified_at'] as String?,
      gender: json['gender'] as String?,
      name: json['name'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'role_id': instance.role_id,
    };
