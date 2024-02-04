import 'package:movies_app/Movies/domain/Entities/movie.dart';
import 'package:movies_app/Movies/domain/Repositories/base_movies_repo.dart';

class GetNowPlayingUseCase {
  final BaseMoviesRebo baseMoviesRebo;

  GetNowPlayingUseCase({required this.baseMoviesRebo});

  Future<List<Movie>> excute() async {
    return await baseMoviesRebo.getNowPlayingMovie();
  }
}