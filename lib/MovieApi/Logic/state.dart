import 'package:equatable/equatable.dart';

abstract class MovieState extends Equatable {}

class InitialState extends MovieState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MovieState {
  @override
  List<Object> get props => [];
}

class LoadedState extends MovieState {
  var movieData;
  LoadedState({this.movieData});
  @override
  List<Object?> get props => [movieData];
}

class ErrorState extends MovieState {
  final String errormsg;

  ErrorState(this.errormsg);
  @override
  List<Object?> get props => [errormsg];
}
