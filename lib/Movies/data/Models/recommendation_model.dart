import 'package:movies_app/movies/domain/entities/recommendation.dart';


class RecommendationModel extends Recommendation {

  const RecommendationModel({

    super.backdropPath,
    super.id,

  });


  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>

      RecommendationModel(

        id: json["id"] ?? 695721,

        backdropPath:

            json["backdrop_path"] ?? '/8GnWDLn2AhnmkQ7hlQ9NJUYobSS.jpg',

      );

}

