import 'package:movie_flutter/components/di/injection/injection.dart';

import '../../../data/datasources/remote/api_movie.dart';
import '../../network/dio_client.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provides() async {
    final dio = await DioClient.setup();

    getIt.registerSingleton(dio);
    getIt.registerSingleton(ApiMovie(dio, baseUrl: dio.options.baseUrl));
  }
}
