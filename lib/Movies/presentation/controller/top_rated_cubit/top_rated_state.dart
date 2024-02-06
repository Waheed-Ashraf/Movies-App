part of 'top_rated_cubit.dart';

sealed class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoadingState extends TopRatedState {}

final class TopRatedLoadedState extends TopRatedState {
  final List<Movie> movie;

  const TopRatedLoadedState({required this.movie});
}

final class TopRatedErrorState extends TopRatedState {
  final String errorMessage;

  const TopRatedErrorState({required this.errorMessage});
}
