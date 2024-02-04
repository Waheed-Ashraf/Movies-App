import 'package:movies_app/Movies/domain/Entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backgroundPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
  });

  factory MovieModel.formJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json["title"],
      backgroundPath: json['backdrop_path'],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      overview: json['overview'],
      voteAverage: json["vote_average"],
    );
  }
}
