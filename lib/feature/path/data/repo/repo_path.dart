import 'package:untitled2/feature/path/data/model/model.dart';

import '../../../../core/networks/api_error_hander.dart';
import '../../../../core/networks/api_get_path.dart';
import '../../../../core/networks/api_result.dart';
import '../../../../core/networks/api_service.dart';
import '../../../auth/login/data/models/login_response.dart';
import '../../ui/tab1.dart';

class PathRepo{
  final ApiService apiService;
  PathRepo(this.apiService);

  Future<ApiResult<TabBaModel>> getPath()async
  {
    try{
      final response = await apiService.getPath();
      List<TabBaModel> data = [];
      TabBaModel tabBaModel = TabBaModel.fromJson(response.toJson());
      print(data);
      return ApiResult.success(tabBaModel);
    }
    catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}