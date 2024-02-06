import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/core/usecase/base_usecase.dart';

import 'package:movies_app/movies/domain/entities/movie.dart';

import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';


part 'now_playing_state.dart';


class NowPlayingCubit extends Cubit<NowPlayingState> {

  NowPlayingCubit(this.getNowPlayingMoviesUseCase) : super(NowPlayingInitial());


  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;


  Future getPlayingNow() async {

    emit(NowPlayingLoadingState());


    var result = await getNowPlayingMoviesUseCase.call(const NoParameters());


    result.fold((failuer) {

      emit(NowPlayingErrorState(errorMessage: failuer.message));

    }, (movieList) {

      print(movieList);


      emit(NowPlayingLoadedState(movie: movieList));

    });

  }

}

