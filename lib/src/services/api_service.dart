import 'dart:developer';

import 'package:flicks_time/src/config/config.dart';
import 'package:flicks_time/src/models/models.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUri = Environment.apiBaseUri;
  final String apiVersion = Environment.apiVersion;
  final String apiToken = Environment.token;

  final Locale locale;

  ApiService({required this.locale});

  Future<ApiResponse> getMovies(String endpoint, [int page = 1]) async {
    Uri uri = Uri.parse(
        '$baseUri/$apiVersion/movie/$endpoint?page=$page&language=${locale.languageCode}');

    log(uri.toString());

    final response =
        await http.get(uri, headers: {'Authorization': 'Bearer $apiToken'});

    if (response.statusCode == 200) {
      final data = ApiResponse.fromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<ApiResponse> searchMovie(String query, [int page = 1]) async {
    Uri uri = Uri.parse(
        '$baseUri/$apiVersion/search/movie?query=$query&page=$page&language=${locale.languageCode}');

    log(uri.toString());

    final response =
        await http.get(uri, headers: {'Authorization': 'Bearer $apiToken'});

    if (response.statusCode == 200) {
      final data = ApiResponse.fromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<MovieDetailsResponse> getMovieDetails(int id) async {
    try {
      Uri uri = Uri.parse(
          '$baseUri/$apiVersion/movie/$id?language=${locale.languageCode}');

      log(uri.toString());

      final response =
          await http.get(uri, headers: {'Authorization': 'Bearer $apiToken'});

      if (response.statusCode == 200) {
        final data = MovieDetailsResponse.fromJson(response.body);
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      log(e.toString());
      print(e);
      throw Exception('Failed to load data');
    }
  }

  Future<MoviesImages> getMovieImages(int id) async {
    Uri uri = Uri.parse('$baseUri/$apiVersion/movie/$id/images');

    log(uri.toString());

    final response =
        await http.get(uri, headers: {'Authorization': 'Bearer $apiToken'});

    if (response.statusCode == 200) {
      final data = MoviesImages.fromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<ApiResponse> getMovieRecommendations(int id) async {
    Uri uri = Uri.parse(
        '$baseUri/$apiVersion/movie/$id/recommendations?language=${locale.languageCode}');

    log(uri.toString());

    final response =
        await http.get(uri, headers: {'Authorization': 'Bearer $apiToken'});

    if (response.statusCode == 200) {
      final data = ApiResponse.fromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<MovieCast> getMovieCast(int id) async {
    Uri uri = Uri.parse(
        '$baseUri/$apiVersion/movie/$id/credits?language=${locale.languageCode}');

    log(uri.toString());

    final response =
        await http.get(uri, headers: {'Authorization': 'Bearer $apiToken'});

    if (response.statusCode == 200) {
      final data = MovieCast.fromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
