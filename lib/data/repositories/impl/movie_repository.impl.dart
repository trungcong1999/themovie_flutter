import 'dart:convert';

import 'package:movie_flutter/data/repositories/movie_repository.dart';
import '../../datasources/remote/api_movie.dart';
import '../../models/movie_result.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiMovie apiMovie;

  MovieRepositoryImpl({required this.apiMovie});

  @override
  Future<List<MovieResult>> getMovies({required int page}) async {
    final response = await apiMovie.getMovies(page);
    final List<MovieResult> movies =
        response.results.map((e) => MovieResult.fromJson(jsonDecode(jsonEncode(e)))).toList();
    return movies;
  }
}
