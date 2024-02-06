import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/errors/failure.dart';
import 'package:movies_app/Movies/domain/Entities/movie.dart';

abstract class BaseMoviesRepo {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}
