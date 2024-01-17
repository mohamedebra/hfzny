import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody{
  final String name;
  final String email;
  final String password;
  final String password_confirmation;
  final int role_id;
  RegisterRequestBody({required this.email, required this.password,required this.name,required this.password_confirmation,required this.role_id});

  Map<String,dynamic> toJson() => _$RegisterRequestBodyToJson(this);

}