
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled2/core/networks/api_constants.dart';
import '../../feature/auth/login/data/models/login_request_body.dart';
import '../../feature/auth/login/data/models/login_response.dart';
import '../../feature/auth/register/data/model/register_request_body.dart';
import '../../feature/auth/register/data/model/register_response.dart';
import '../../feature/path/data/model/model.dart';



part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class
ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
      @Body()  LoginRequestBody loginRequestBody,
      );
  @POST(ApiConstants.register)
  Future<RegisterResponse> register(
      @Body() RegisterRequestBody registerRequestBody,
      );

  @GET(ApiConstants.paths)
  Future<TabBaModel> getPath();

}

