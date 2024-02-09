import 'package:get_it/get_it.dart';

import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';

import 'package:movies_app/movies/data/repository/movies_repository.dart';

import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';

import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';

import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';

import 'package:movies_app/movies/domain/usecases/get_recommendation_usecase.dart';

import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/MoreLikeThisCubit/more_like_this_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_app/movies/presentation/controller/pobular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/movies/presentation/controller/top_rated_cubit/top_rated_cubit.dart';

import 'package:movies_app/movies/presentation/controller/now_playing_cubit/now_playing_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Cubit

    sl.registerFactory(() => NowPlayingCubit(
          sl(),
        ));

    sl.registerFactory(() => TopRatedCubit(
          sl(),
        ));
    sl.registerFactory(() => PopularMoviesCubit(
          sl(),
        ));

    sl.registerFactory(() => MovieDetailsCubit(
          sl(),
        ));
    sl.registerFactory(() => MoreLikeThisCubit(
          sl(),
        ));

    // sl.registerFactory(() => MovieDetailsBloc(sl()));

    /// Use Cases

    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));

    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// Repository

    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    /// DATA SOURCE

    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
