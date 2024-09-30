abstract final class DemoEnvironment {
  static const bool isDev = String.fromEnvironment('flavor') == 'development';
  static const bool isNotDev = String.fromEnvironment('flavor') != 'development';
  static const bool isStag = String.fromEnvironment('flavor') == 'staging';
  static const bool isNotStag = String.fromEnvironment('flavor') != 'staging';
  static const bool isProd = String.fromEnvironment('flavor') == 'production';
  static const bool isNotProd = String.fromEnvironment('flavor') != 'production';

  static const String baseUrl = String.fromEnvironment('base_url');
}
