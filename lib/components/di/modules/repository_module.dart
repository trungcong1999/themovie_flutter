import 'package:movie_flutter/components/di/injection/injection.dart';
import 'package:movie_flutter/data/datasources/remote/api_movie.dart';
import 'package:movie_flutter/data/repositories/impl/movie_repository.impl.dart';
import 'package:movie_flutter/data/repositories/movie_repository.dart';
import 'package:movie_flutter/presentation/features/home/interactor/home_repository.dart';
import 'package:movie_flutter/presentation/features/home/repositories/home_repository.impl.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerFactory<MovieRepository>(
      () => MovieRepositoryImpl(
        apiMovie: getIt.get<ApiMovie>(),
      ),
    );
    getIt.registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(
        movieRepository: getIt.get<MovieRepository>(),
      ),
    );
  }
}
