import 'package:sera_test/src/util/constants/demo_enviroment.dart';

abstract class Endpoints {
  static Uri _createUriBaseUrl(String path) =>
      Uri.parse("${DemoEnvironment.baseUrl}$path");

  static Uri login = _createUriBaseUrl('/auth/login');
  static Uri users = _createUriBaseUrl('/users');
  static Uri products = _createUriBaseUrl('/products');
  static Uri product(String id) =>
      _createUriBaseUrl('/products/:id'.replaceAll(":id", id));
  static Uri carts(String userId) =>
      _createUriBaseUrl('/carts/user/:userId'.replaceAll(":userId", userId));
}
