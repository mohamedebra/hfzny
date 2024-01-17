import 'package:untitled2/feature/path/data/model/model.dart';

import '../../../../core/networks/api_error_hander.dart';
import '../../../../core/networks/api_result.dart';
import '../../../../core/networks/api_service.dart';


class PathRepo{
  final ApiService apiService;
  PathRepo(this.apiService);

  Future<ApiResult<TabBaModel>> getPath()async
  {
    try{
      final response = await apiService.getPath();
      TabBaModel tabBaModel = TabBaModel.fromJson(response.toJson());
      return ApiResult.success(tabBaModel);
    }
    catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}