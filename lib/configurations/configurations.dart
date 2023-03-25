import 'package:movie_flutter/configurations/default_env.dart';

class Configurations {
  static String _baseUrl = DefaultConfig.baseUrl;
  static String _environment = DefaultConfig.environment;

  void setConfigurationValues(Map<String, dynamic> value) {
    _environment = value['environment'] as String;
    _baseUrl = value['baseUrl'] as String;
  }

  static String get baseUrl => _baseUrl;
  static String get environment => _environment;
}


