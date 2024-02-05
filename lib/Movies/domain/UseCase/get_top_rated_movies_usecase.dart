import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/errors/failure.dart';
import 'package:movies_app/Movies/domain/Entities/movie.dart';
import 'package:movies_app/Movies/domain/Repositories/base_movies_repo.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRebo baseMoviesRebo;

  GetTopRatedMoviesUseCase({required this.baseMoviesRebo});

  Future<Either<Failure, List<Movie>>> excute() async {
    return await baseMoviesRebo.getTopRatedMovies();
  }
}
