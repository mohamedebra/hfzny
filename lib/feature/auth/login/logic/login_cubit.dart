

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled2/feature/auth/login/logic/login_state.dart';

import '../data/models/login_request_body.dart';
import '../data/repo/login_repo.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super( LoginInitial());

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  void emitLoginStates(LoginRequestBody loginRequestBody) async{
    emit(LoginLoading());
    final response =await loginRepo.login(loginRequestBody);
    response.when(success: (loginResponse){
      emit(LoginSuccess(loginResponse));
    }, failure: (error){
      emit(LoginError(error.apiErrorModel.message ?? ''));
    }
    );}
}
