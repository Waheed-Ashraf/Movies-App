import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  TopRatedCubit(this.getTopRatedMoviesUseCase) : super(TopRatedInitial());
  Future getTopRatedMovies() async {
    emit(TopRatedLoadingState());

    var result = await getTopRatedMoviesUseCase.call(const NoParameters());

    result.fold((failuer) {
      emit(TopRatedErrorState(errorMessage: failuer.message));
    }, (movieList) {
      emit(TopRatedLoadedState(movie: movieList));
    });
  }
}
