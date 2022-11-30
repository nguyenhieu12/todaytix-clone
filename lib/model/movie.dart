import 'dart:convert';

import 'package:flutter_project/model/cast.dart';

class Movie {
  int id;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  double voteAverage;
  List<int> genreIds;
  // List<Cast> cast;
  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.genreIds,
    // required this.cast,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
        id: map['id'] as int,
        title: map['title'] ?? '',
        posterPath: map['poster_path'] ?? '',
        backdropPath: map['backdrop_path'] ?? '',
        overview: map['overview'] ?? '',
        releaseDate: map['release_date'] ?? '',
        voteAverage: map['vote_average']?.toDouble() ?? 0.0,
        genreIds: List<int>.from(map['genre_ids']),
        // cast: List<Cast>.from(map['credits']['cast'])
    );
  }

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
