import 'package:movie_flutter/data/models/movie_result.dart';


abstract class MovieRepository {
  Future<List<MovieResult>> getMovies({required int page});
}