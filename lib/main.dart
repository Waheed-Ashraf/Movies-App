import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/core/services/services_locator.dart';

import 'package:movies_app/core/utils/app_router.dart';

import 'package:movies_app/core/utils/app_string.dart';
import 'package:movies_app/movies/presentation/controller/now_playing_cubit/now_playing_cubit.dart';
import 'package:movies_app/movies/presentation/controller/pobular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/movies/presentation/controller/top_rated_cubit/top_rated_cubit.dart';

void main() {
  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<NowPlayingCubit>()..getPlayingNow(),
        ),
        BlocProvider(
          create: (context) => sl<TopRatedCubit>()..getTopRatedMovies(),
        ),
        BlocProvider(
          create: (context) => sl<PopularMoviesCubit>()..getPopularMovies(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: AppString.appName,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
      ),
    );
  }
}
