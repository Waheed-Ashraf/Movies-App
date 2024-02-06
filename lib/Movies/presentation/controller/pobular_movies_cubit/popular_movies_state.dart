part of 'popular_movies_cubit.dart';

sealed class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesLoadingState extends PopularMoviesState {}

final class PopularMoviesLoadedState extends PopularMoviesState {
  final List<Movie> movie;

  const PopularMoviesLoadedState({required this.movie});
}

final class PopularMoviesErrorState extends PopularMoviesState {
  final String errorMessage;

  const PopularMoviesErrorState({required this.errorMessage});
}
