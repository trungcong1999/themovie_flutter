import 'package:movie_flutter/presentation/features/home/interactor/home_interactor.dart';
import 'package:movie_flutter/presentation/features/home/interactor/home_repository.dart';

import '../../../../../data/models/movie_result.dart';

class HomeInteractorImpl extends HomeInteractor {
  final HomeRepository homeRepository;

  HomeInteractorImpl({required this.homeRepository});

  @override
  Future<List<MovieResult>> getMovies({required int page}) {
    return homeRepository.getMovies(page: page);
  }
}
