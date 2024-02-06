import 'package:get_it/get_it.dart';
import 'package:movies_app/Movies/data/Repository/movies_repo.dart';
import 'package:movies_app/Movies/domain/Repositories/base_movies_repo.dart';
import 'package:movies_app/Movies/domain/UseCase/get_now_playing_usecase.dart';
import 'package:movies_app/Movies/domain/UseCase/get_popular_movies_usecase.dart';
import 'package:movies_app/Movies/domain/UseCase/get_top_rated_movies_usecase.dart';
import 'package:movies_app/Movies/presentation/Controllers/Now_Playing_cubit/now_playing_cubit.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Cubit
    sl.registerFactory(() => NowPlayingCubit(sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepo>(() => MovieRepo(sl()));

    /// DATA SOURCE
    // sl.registerLazySingleton<BaseMovieRemoteDataSource>(
    //     () => MovieRemoteDataSource());

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
