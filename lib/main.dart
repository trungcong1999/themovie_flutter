import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_flutter/components/di/injection/injection.dart';
import 'package:movie_flutter/configurations/configurations.dart';
import 'package:movie_flutter/env.dart';
import 'package:movie_flutter/presentation/app.dart';

void main() {
  Configurations().setConfigurationValues(environment);

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Injection.inject();

    runApp(const MyApp());
  }, (obj, StackTrace stack) {
    LogUtils.d(' ------ main.dart ------');
    LogUtils.d(obj);
    LogUtils.d(stack);
  });
}
