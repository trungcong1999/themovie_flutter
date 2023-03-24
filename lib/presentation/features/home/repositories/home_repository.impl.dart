import 'package:movie_flutter/data/repositories/movie_repository.dart';
import 'package:movie_flutter/presentation/features/home/interactor/home_repository.dart';

import '../../../../data/models/movie_result.dart';

class HomeRepositoryImpl extends HomeRepository {
  final MovieRepository movieRepository;

  HomeRepositoryImpl({required this.movieRepository});

  @override
  Future<List<MovieResult>>getMovies({required int page}) {
    return movieRepository.getMovies(page: page);
  }
}
