import 'dart:async';


import 'package:equatable/equatable.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:movies_app/movies/domain/entities/recommendation.dart';


import 'package:movies_app/movies/domain/usecases/get_recommendation_usecase.dart';


part 'more_like_this_state.dart';


class MoreLikeThisCubit extends Cubit<MoreLikeThisState> {

  final GetRecommendationUseCase getRecommendationUseCase;


  MoreLikeThisCubit(this.getRecommendationUseCase)

      : super(MoreLikeThisInitial());


  Future getRecomendedMovies(int id) async {

    emit(MoreLikeThisLoadingState());


    var result = await getRecommendationUseCase(RecommendationParameters(id));


    Timer(const Duration(seconds: 1), () {

      result.fold((failuer) {

        emit(MoreLikeThisErrorState(errorMessage: failuer.message));

      }, (recommendedMovies) {

        emit(MoreLikeThisLoadedState(recommendation: recommendedMovies));

      });

    });

  }

}

