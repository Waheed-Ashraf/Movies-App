import 'package:movies_app/Movies/domain/Entities/movie.dart';

abstract class BaseMoviesRebo {
  Future<List<Movie>> getNowPlayingMovie();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
}
