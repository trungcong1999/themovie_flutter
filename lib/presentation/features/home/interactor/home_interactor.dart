import '../../../../data/models/movie_result.dart';

abstract class HomeInteractor {
  Future<List<MovieResult>> getMovies({required int page});
}
