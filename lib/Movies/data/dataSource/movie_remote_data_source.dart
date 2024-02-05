import 'package:dio/dio.dart';
import 'package:movies_app/Core/errors/exceptions.dart';
import 'package:movies_app/Core/network/error_message_model.dart';
import 'package:movies_app/Core/utlis/app_constance.dart';
import 'package:movies_app/Movies/data/Models/movie_model.dart';

class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        '${AppConstance.baseUrl}/movie/now_playing?api_key=${AppConstance.apiKey}');
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.formJson(e),
        ),
      );
    } else {
      throw ServerErrors(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}






//another Methode to get data from api ===============>>>>>>>>>
      // List<MovieModel> data = response.data["results"];
      // List<MovieModel> playingNowMovieList = [];
      // for (var element in data) {
      //   playingNowMovieList.add(element);
      // }
      // return playingNowMovieList;