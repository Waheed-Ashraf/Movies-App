import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/components/movieDetails/movie_details_body.dart';

import 'package:movies_app/movies/presentation/controller/MoreLikeThisCubit/more_like_this_cubit.dart';

import 'package:movies_app/movies/presentation/controller/movie_details_cubit/movie_details_cubit.dart';

class MovieDetailScreen extends StatefulWidget {
  final int id;

  const MovieDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<MovieDetailsCubit>(context).getMovieDetails(widget.id);
    BlocProvider.of<MoreLikeThisCubit>(context).getRecomendedMovies(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MovieDetailBody(),
    );
  }
}
