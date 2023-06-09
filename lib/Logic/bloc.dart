import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks2/Data/Repository/movierepo.dart';
import 'package:tasks2/Logic/event.dart';
import 'package:tasks2/Logic/state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  Repository repository = Repository();

  MovieBloc(this.repository) : super(InitialState()) {
    on<ButtonEvent>(
      (event, emit) async {
        emit(LoadingState());

        try {
          var movieData = await repository.getApiValue();
          if (movieData != null) {
            emit(LoadedState(movieData: movieData));
          }
        } catch (e) {
          emit(ErrorState(e.toString()));
          print(e);
        }
      },
    );
  }
}
