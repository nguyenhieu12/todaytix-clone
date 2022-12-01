import 'dart:convert';
import '../api/api.dart';
import '../model/cast.dart';
import '../model/movie.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Movie>?> getUpcomingMovies() async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}movie/upcoming?api_key=${Api.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].skip(6).take(5).forEach(
            (m) => movies.add(
              Movie.fromMap(m),
            ),
          );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getAllUpcomingMovies() async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}movie/upcoming?api_key=${Api.apiKey}&language=en-US'));
      var res = jsonDecode(response.body);
      res['results'].take(10).forEach(
            (m) => movies.add(
              Movie.fromMap(m),
            ),
          );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Cast>?> getAllCast(int movieId) async {
    List<Cast> cast = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/casts?api_key=${Api.apiKey}'));
      var res = jsonDecode(response.body);
      res['results'].forEach((c) {
        cast.add(Cast(
            name: c['name'],
            profileURL: c['profile_path'],
            character: c['character']));
      });
      return cast;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getSimilarMovie(int movieId) async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=${Api.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].take(6).forEach(
            (m) => movies.add(
              Movie.fromMap(m),
            ),
          );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getSearchedMovies(String query) async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=40797ff2c89935778fc86188943b775a&language=en-US&query=$query&include_adult=false'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
        (m) => movies.add(
          Movie.fromMap(m),
        ),
      );
      return movies;
    } catch (e) {
      return null;
    }
  }
}
