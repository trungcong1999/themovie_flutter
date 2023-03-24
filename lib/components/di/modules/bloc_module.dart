import 'package:movie_flutter/components/di/injection/injection.dart';

import '../../../presentation/features/home/bloc/home_bloc.dart';
import '../../../presentation/features/home/interactor/home_repository.dart';
import '../../../presentation/features/home/interactor/impl/home_interactor.impl.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerFactory<HomeBloc>(
      () => HomeBloc(
        interactor: HomeInteractorImpl(
          homeRepository: getIt<HomeRepository>(),
        ),
      ),
    );
  }
}
