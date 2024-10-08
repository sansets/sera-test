import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sera_test/src/data/datasources/network/constant/endpoints.dart';
import 'package:sera_test/src/data/datasources/network/model/demo_exception.dart';
import 'package:sera_test/src/data/models/body/carts_body.dart';

import 'package:sera_test/src/data/models/body/login_body.dart';
import 'package:sera_test/src/data/models/body/product_body.dart';
import 'package:sera_test/src/data/models/body/products_body.dart';
import 'package:sera_test/src/data/models/body/users_body.dart';
import 'package:sera_test/src/data/models/response/cart_response.dart';
import 'package:sera_test/src/data/models/response/login_response.dart';
import 'package:sera_test/src/data/models/response/product_response.dart';
import 'package:sera_test/src/data/models/response/user_response.dart';

class RemoteDataSource {
  RemoteDataSource({required this.client});

  final http.Client client;

  Future<LoginResponse> login(LoginBody body) async {
    final response = await client.post(
      Endpoints.login,
      body: body.toMap(),
    );

    handleErrorResponse(response);
    return LoginResponse.fromJson(response.body);
  }

  Future<List<UserResponse>> users(UsersBody body) async {
    final response = await client.get(
      Endpoints.users.replace(queryParameters: body.toMap()),
    );

    handleErrorResponse(response);

    final mapResponse = jsonDecode(response.body);
    return List.from(mapResponse.map((e) => UserResponse.fromMap(e)));
  }

  Future<List<ProductResponse>> products(ProductsBody body) async {
    final response = await client.get(
      Endpoints.products.replace(queryParameters: body.toMap()),
    );

    handleErrorResponse(response);

    final mapResponse = jsonDecode(response.body);
    return List.from(mapResponse.map((e) => ProductResponse.fromMap(e)));
  }

  Future<ProductResponse> product(ProductBody body) async {
    final response = await client.get(
      Endpoints.product(body.id.toString()),
    );

    handleErrorResponse(response);

    return ProductResponse.fromJson(response.body);
  }

  Future<List<CartResponse>> carts(CartsBody body) async {
    final response = await client.get(
      Endpoints.carts(body.userId.toString()),
    );

    handleErrorResponse(response);

    final mapResponse = jsonDecode(response.body);
    return List.from(mapResponse.map((e) => CartResponse.fromMap(e)));
  }
}
