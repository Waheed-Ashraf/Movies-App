import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  PopularMoviesCubit(this.getPopularMoviesUseCase)
      : super(PopularMoviesInitial());
  Future getPopularMovies() async {
    emit(PopularMoviesLoadingState());

    var result = await getPopularMoviesUseCase.call(const NoParameters());

    result.fold((failuer) {
      emit(PopularMoviesErrorState(errorMessage: failuer.message));
    }, (movieList) {
      emit(PopularMoviesLoadedState(movie: movieList));
    });
  }
}
