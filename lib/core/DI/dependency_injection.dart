

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled2/feature/path/data/repo/repo_path.dart';
import 'package:untitled2/feature/path/logic/path_cubit.dart';

import '../../feature/auth/login/data/repo/login_repo.dart';
import '../../feature/auth/login/logic/login_cubit.dart';
import '../../feature/auth/register/data/repo/register_repo.dart';
import '../../feature/auth/register/logic/register_cubit.dart';
import '../networks/api_service.dart';
import '../networks/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async{

  Dio dio =  DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(ApiService(Dio())));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  // register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));

  getIt.registerLazySingleton<PathRepo>(() => PathRepo(getIt()));
  getIt.registerLazySingleton<PathCubit>(() => PathCubit(getIt()));
}