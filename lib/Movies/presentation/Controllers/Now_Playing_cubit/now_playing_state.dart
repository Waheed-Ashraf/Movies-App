part of 'now_playing_cubit.dart';


sealed class NowPlayingState extends Equatable {

  const NowPlayingState();


  @override

  List<Object> get props => [];

}


final class NowPlayingInitial extends NowPlayingState {}


final class NowPlayingLoadingState extends NowPlayingState {}


final class NowPlayingLoadedState extends NowPlayingState {
  final List<Movie> movie;

  const NowPlayingLoadedState({required this.movie});

}


final class NowPlayingErrorState extends NowPlayingState {

  final String errorMessage;


  const NowPlayingErrorState({required this.errorMessage});

}

