import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/di/injection/injection.dart';
import 'home/bloc/home_bloc.dart';
import 'home/home_screen.dart';

class Routes {
  static const String home = 'home';

  static Map<String, WidgetBuilder> _getAll(RouteSettings settings) => {
        Routes.home: (context) => BlocProvider(
              create: (context) => getIt<HomeBloc>(),
              child: const HomeScreen(),
            ),
      };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final builder = _getAll(settings)[settings.name];
    return MaterialPageRoute(
      builder: builder!,
      settings: settings,
      fullscreenDialog: false,
    );
  }
}
