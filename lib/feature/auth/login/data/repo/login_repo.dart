


import 'package:dio/dio.dart';
import 'package:untitled2/core/networks/api_constants.dart';

import '../../../../../core/networks/api_error_hander.dart';
import '../../../../../core/networks/api_result.dart';
import '../../../../../core/networks/api_service.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';


class LoginRepo{
  final ApiService apiService;
  LoginRepo(this.apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody)async
  {
    try{
      final response = await apiService.login(loginRequestBody);
      print(response);
      return ApiResult.success(response);
    }
        catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
        }
  }


}