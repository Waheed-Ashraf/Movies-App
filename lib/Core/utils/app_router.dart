import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/controller/MoreLikeThisCubit/more_like_this_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';
import 'package:movies_app/movies/presentation/screens/see_more_popular_screen.dart';
import 'package:movies_app/movies/presentation/screens/see_more_top_rated_movies.dart';
import 'package:movies_app/splash/presentation/View/splash_view.dart';

abstract class AppRouter {
  static const kMovieView = '/mainMovieScreen';
  static const kMovieDetailsView = '/movieDetailsScreen';
  static const kSeeMorePopularMovies = '/seeMorePopularMoviesScreen';
  static const kSeeMoreTopRatedMovies = '/seeMoreTopRatedMoviesMoviesScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSeeMorePopularMovies,
        builder: (context, state) => const SeeMorePopularMoviesScreen(),
      ),
      GoRoute(
        path: kSeeMoreTopRatedMovies,
        builder: (context, state) => const SeeMoreTopRatedMoviesScreen(),
      ),

      GoRoute(
        path: kMovieView,
        builder: (context, state) => const MainMoviesScreen(),
      ),

      GoRoute(
        path: kMovieDetailsView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<MovieDetailsCubit>(),
            ),
            BlocProvider(
              create: (context) => sl<MoreLikeThisCubit>(),
            ),
          ],
          child: MovieDetailScreen(
            id: state.extra as int,
          ),
        ),
      ),

      // GoRoute(
      //   path: kMovieDetailsView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SimillarBooksCubit(
      //       getIt.get<HomeRepoimp>(),
      //     ),
      //     child: BookDetailsView(
      //       bookModel: state.extra as BookItemModel,
      //     ),
      //   ),
      // ),
    ],
  );
}
