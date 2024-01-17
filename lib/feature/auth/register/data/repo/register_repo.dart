


import '../../../../../../core/networks/api_error_hander.dart';
import '../../../../../../core/networks/api_result.dart';
import '../../../../../../core/networks/api_service.dart';
import '../model/register_request_body.dart';
import '../model/register_response.dart';

class RegisterRepo{
  final ApiService apiService;
  RegisterRepo(this.apiService);

  Future<ApiResult<RegisterResponse>> register(RegisterRequestBody registerRequestBody)async
  {
    try{
      final response = await apiService.register(registerRequestBody);
      return ApiResult.success(response );
    }
    catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}