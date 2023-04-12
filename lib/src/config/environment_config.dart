class EnvironmentConfig {
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: "https://api.themoviedb.org/3/",
  );
  static const imageBaseUrl = String.fromEnvironment(
    'IMAGE_BASE_URL',
    defaultValue: "https://image.tmdb.org/t/p/w500",
  );
  static const imageOriginalBaseUrl = String.fromEnvironment(
    'IMAGE_BASE_URL',
    defaultValue: "https://image.tmdb.org/t/p/original",
  );
  static const apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: "API_KEY",
  );
}
