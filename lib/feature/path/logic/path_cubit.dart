import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled2/core/networks/api_service.dart';
import 'package:untitled2/feature/path/data/model/model.dart';
import 'package:untitled2/feature/path/data/repo/repo_path.dart';

import '../../../core/networks/api_get_path.dart';

part 'path_state.dart';

class PathCubit extends Cubit<PathState> {
  final PathRepo repo;

  static PathCubit get(context) => BlocProvider.of(context);

  TabBaModel tabBaModel = TabBaModel();
  PathCubit(this.repo) : super(PathInitial());
  int currentIndex = 0;
  List<PathItems>? currentItems  ;

  void emitPathStates( ) async{

    emit(PathLoading());
    try{
      var response =await repo.getPath();
      response.when(success: (data){
        emit(PathSuccess(data));
      },
          failure: (error){
        emit(PathError(error.apiErrorModel.message ?? ''));

      });

      // print(tabBaModel.paths);
    }catch(error){
      emit(PathError(error.toString()));
    }
    }

    void nextPath(){

      currentItems= tabBaModel.paths![currentIndex].pathItems![currentIndex] as List<PathItems>?;
      currentIndex ++;
      emit(NextState());

    }

}
