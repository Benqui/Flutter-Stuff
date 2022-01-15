// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/models/search_movie_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '2651a4c1a67183d3629c7cd85e53f9bd';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> movieCast = {};
  int _popularPage = 0;

  MoviesProvider() {
    print('Movies Provider inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    // var url = Uri.https(_baseUrl, '3/movie/now_playing', {
    //   'api_key': _apiKey,
    //   'language': _language,
    //   'page': '1',
    // });

    // final response = await http.get(url);
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    // var url = Uri.https(_baseUrl, '3/movie/popular', {
    //   'api_key': _apiKey,
    //   'language': _language,
    //   'page': '1',
    // });

    // final response = await http.get(url);
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getmovieCast(int movieId) async {
    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;

    print('llamando actores al servidor');
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;

    // print('getmovieCast');
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query,
    });
    final response = await http.get(url);
    final searchMovieResponse = SearchMovieResponse.fromJson(response.body);
    return searchMovieResponse.results;
  }
}
