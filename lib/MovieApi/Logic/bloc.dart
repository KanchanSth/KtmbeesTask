import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks2/MovieApi/Data/Repository/movierepo.dart';
import 'package:tasks2/MovieApi/Logic/event.dart';
import 'package:tasks2/MovieApi/Logic/state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  Repository repository = Repository();

  MovieBloc() : super(InitialState()) {
    on<ButtonEvent>(
      (event, emit) async {
        emit(LoadingState());

        try {
          var movieData = await repository.getApiValue();
          //if (movieData != null) {
          emit(LoadedState(movieData: movieData));
          //}
        } catch (e) {
          emit(ErrorState(e.toString()));
          print(e);
        }
      },
    );
  }
}
