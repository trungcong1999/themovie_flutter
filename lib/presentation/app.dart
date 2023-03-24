import 'package:flutter/material.dart';
import 'package:movie_flutter/presentation/features/routes.dart';
import 'package:movie_flutter/presentation/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.home,
      onGenerateRoute: Routes.generateRoute,
      theme: defaultTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
