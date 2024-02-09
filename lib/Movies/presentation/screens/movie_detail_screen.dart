import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/controller/MoreLikeThisCubit/more_like_this_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_cubit/movie_details_body.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_cubit/movie_details_cubit.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;
  const MovieDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<MovieDetailsCubit>()..getMovieDetails(id),
        ),
        BlocProvider(
          create: (context) => sl<MoreLikeThisCubit>()..getRecomendedMovies(id),
        ),
      ],
      child: const Scaffold(
        body: MovieDetailBody(),
      ),
    );
  }
}
