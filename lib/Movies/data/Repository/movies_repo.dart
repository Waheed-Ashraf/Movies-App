import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/errors/exceptions.dart';
import 'package:movies_app/Core/errors/failure.dart';
import 'package:movies_app/Movies/data/dataSource/movie_remote_data_source.dart';
import 'package:movies_app/Movies/domain/Entities/movie.dart';
import 'package:movies_app/Movies/domain/Repositories/base_movies_repo.dart';

class MovieRepo implements BaseMoviesRepo {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepo(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
