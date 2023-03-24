import 'package:get_it/get_it.dart';
import 'package:movie_flutter/components/di/modules/api_module.dart';
import 'package:movie_flutter/components/di/modules/bloc_module.dart';
import 'package:movie_flutter/components/di/modules/repository_module.dart';

GetIt getIt = GetIt.instance;

abstract class DIModule {
  void provides();
}

class Injection {
  static Future<void> inject() async {
    await ApiModule().provides();
    await RepositoryModule().provides();
    await BlocModule().provides();
  }
}
