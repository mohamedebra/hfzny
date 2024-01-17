// import 'dart:ui';
//
// import 'package:dio/dio.dart';
// import 'package:untitled2/core/networks/api_constants.dart';
// import 'package:untitled2/core/networks/api_service.dart';
//
// import '../../feature/path/data/model/model.dart';
//
// class UserService {
//   final Dio dio = Dio();
//
//   Future<Map<String,dynamic>> getUsers() async {
//     try {
//       final response = await dio.get('${ApiConstants.apiBaseUrl}paths');
//       if (response.statusCode == 200) {
//         // print();
//         // Parsing the list of users
//         return response.data ;
//       } else {
//         throw Exception('Failed to load users');
//       }
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }
// }