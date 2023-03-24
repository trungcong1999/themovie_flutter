import 'dart:async';

import 'package:dio/dio.dart';
import 'package:movie_flutter/configurations/configurations.dart';

class DioClient {
  static FutureOr<Dio> setup() async {
    final options = BaseOptions(
      responseType: ResponseType.json,
      baseUrl: Configurations.baseUrl,
      
    );

    final dio = Dio(options);
    return dio;
  }
}
