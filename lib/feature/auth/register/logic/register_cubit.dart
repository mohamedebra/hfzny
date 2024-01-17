import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/feature/auth/register/data/model/register_request_body.dart';

import '../data/repo/register_repo.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;

  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerpasswordvalid = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(RegisterRequestBody registerRequestBody) async {
    emit(RegisterLoading());

    final response = await registerRepo.register(registerRequestBody );
    response.when(success: (loginResponse) {
      emit(RegisterSuccess(loginResponse));
    }, failure: (error) {
      emit(RegisterError(error.apiErrorModel.message ?? ''));
    });
  }
}
