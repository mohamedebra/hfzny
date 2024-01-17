part of 'path_cubit.dart';

@immutable
abstract class PathState {}

class PathInitial extends PathState {}
class PathLoading extends PathState {}
class PathSuccess extends PathState {
  TabBaModel data;
  PathSuccess(this.data);
}

class PathError extends PathState {
  String error;
  PathError(this.error);
}