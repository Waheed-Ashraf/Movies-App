import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  MovieDetailsCubit(
    this.getMovieDetailsUseCase,
  ) : super(MovieDetailsInitial());

  Future getMovieDetails(int id) async {
    emit(MovieDetailsLoadingState());
    var result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: id));

    result.fold((failuer) {
      emit(MovieDetailsErrorState(errorMessage: failuer.message));
    }, (movieDetail) {
      print(movieDetail);
      emit(MovieDetailsLoadedState(movieDetail: movieDetail));
    });
  }
}
