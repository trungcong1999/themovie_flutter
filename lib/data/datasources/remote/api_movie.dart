import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/movie_model.dart';

part 'api_movie.g.dart';

@RestApi()
abstract class ApiMovie {
  factory ApiMovie(Dio dio, {String baseUrl}) = _ApiMovie;

  @GET('movie?api_key=26763d7bf2e94098192e629eb975dab0&page={page}')
  Future<MovieModel> getMovies(@Path() int page);
}
