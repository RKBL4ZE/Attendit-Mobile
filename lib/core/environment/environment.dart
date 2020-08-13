class EnvironmentConfig {
  static const APP_NAME =
      String.fromEnvironment('APP_NAME', defaultValue: 'Attendit-Dev');
  static const APP_SUFFIX = String.fromEnvironment('APP_SUFFIX');
  static const API_URL = String.fromEnvironment('API_URL',
      defaultValue: 'https://dev-api.attendit.in/');
}
