part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  var data;
  RegisterSuccess(this.data);
}

class RegisterError extends RegisterState {
  String error;
  RegisterError(this.error);
}
