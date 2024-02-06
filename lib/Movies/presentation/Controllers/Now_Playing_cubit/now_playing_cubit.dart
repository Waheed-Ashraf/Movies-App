import 'package:equatable/equatable.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:movies_app/Movies/domain/Entities/movie.dart';


import 'package:movies_app/Movies/domain/UseCase/get_now_playing_usecase.dart';


part 'now_playing_state.dart';


class NowPlayingCubit extends Cubit<NowPlayingState> {

  final GetNowPlayingUseCase getNowPlayingUseCase;


  NowPlayingCubit(this.getNowPlayingUseCase) : super(NowPlayingInitial());


  Future getPlayingNow() async {

    emit(NowPlayingLoadingState());


    var result = await getNowPlayingUseCase.excute();


    result.fold((failuer) {

      emit(NowPlayingErrorState(errorMessage: failuer.message));

    }, (movieList) {

      print(movieList);


      emit(NowPlayingLoadedState(movie: movieList));

    });

  }

}

