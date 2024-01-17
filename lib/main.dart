import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/helper/chache_helper.dart';
import 'package:untitled2/core/routes/app_router.dart';
import 'package:untitled2/my_app.dart';

import 'core/DI/dependency_injection.dart';
import 'core/networks/api_get_path.dart';
import 'core/networks/api_service.dart';
import 'feature/path/data/repo/repo_path.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  CacheHelper.init();

  setupGetIt();
  runApp( MyApp(appRouter: AppRouter(),));
}


