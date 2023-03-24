
import '../../../../data/models/movie_result.dart';

abstract class HomeRepository {
  Future<List<MovieResult>> getMovies({required int page});
}
