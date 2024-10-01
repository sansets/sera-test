import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sera_test/src/data/datasources/network/constant/endpoints.dart';
import 'package:sera_test/src/data/datasources/network/model/demo_exception.dart';
import 'package:sera_test/src/data/datasources/network/remote_data_source.dart';
import 'package:sera_test/src/data/models/body/carts_body.dart';
import 'package:sera_test/src/data/models/body/login_body.dart';
import 'package:sera_test/src/data/models/body/product_body.dart';
import 'package:sera_test/src/data/models/body/products_body.dart';
import 'package:sera_test/src/data/models/body/users_body.dart';
import 'package:sera_test/src/data/models/response/address_response.dart';
import 'package:sera_test/src/data/models/response/cart_product_response.dart';
import 'package:sera_test/src/data/models/response/cart_response.dart';
import 'package:sera_test/src/data/models/response/geolocation_response.dart';
import 'package:sera_test/src/data/models/response/login_response.dart';
import 'package:sera_test/src/data/models/response/name_response.dart';
import 'package:sera_test/src/data/models/response/product_response.dart';
import 'package:sera_test/src/data/models/response/rating_response.dart';
import 'package:sera_test/src/data/models/response/user_response.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late RemoteDataSource remoteDataSource;

  const loginBody = LoginBody(
    username: "johnd",
    password: "m38rmF\$",
  );
  const loginResponse = LoginResponse(token: "eyJhbGciOiJIUzI1NiIsInR");
  const loginResponseString = """
{
    "token": "eyJhbGciOiJIUzI1NiIsInR"
}
""";

  const usersBody = UsersBody();
  const usersResponse = [
    UserResponse(
      id: "1",
      email: "john@gmail.com",
      username: "johnd",
      password: "m38rmF\$",
      name: NameResponse(
        firstname: "john",
        lastname: "doe",
      ),
      address: AddressResponse(
        city: "kilcoole",
        street: "new road",
        number: 7682,
        zipcode: "12926-3874",
        geolocation: GeolocationResponse(
          lat: -37.3159,
          long: 81.1496,
        ),
      ),
      phone: "1-570-236-7033",
    ),
  ];
  const usersResponseString = """
[
    {
        "address": {
            "geolocation": {
                "lat": "-37.3159",
                "long": "81.1496"
            },
            "city": "kilcoole",
            "street": "new road",
            "number": 7682,
            "zipcode": "12926-3874"
        },
        "id": 1,
        "email": "john@gmail.com",
        "username": "johnd",
        "password": "m38rmF\$",
        "name": {
            "firstname": "john",
            "lastname": "doe"
        },
        "phone": "1-570-236-7033",
        "__v": 0
    }
]
""";

  const productBody = ProductBody(
    id: "1",
  );
  const productResponse = ProductResponse(
    id: "1",
    title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    price: 109.95,
    category: "men's clothing",
    description:
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    rating: RatingResponse(
      rate: 3.9,
      count: 120,
    ),
  );
  const productResponseString = """
{
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating": {
        "rate": 3.9,
        "count": 120
    }
}
""";

  const productsBody = ProductsBody();
  const productsResponse = [productResponse];
  const productsResponseString = """
[
    {
        "id": 1,
        "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        "price": 109.95,
        "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "rating": {
            "rate": 3.9,
            "count": 120
        }
    }
]
""";

  const cartsBody = CartsBody(
    userId: "1",
  );
  const cartsResponse = [
    CartResponse(
      id: 1,
      userId: 1,
      date: "2020-03-02T00:00:00.000Z",
      products: [
        CartProductResponse(
          productId: "1",
          quantity: "4",
        )
      ],
    ),
  ];
  const cartsResponseString = """
[
    {
        "id": 1,
        "userId": 1,
        "date": "2020-03-02T00:00:00.000Z",
        "products": [
            {
                "productId": 1,
                "quantity": 4
            }
        ],
        "__v": 0
    }
]
""";

  setUp(() {
    mockClient = MockClient();
    remoteDataSource = RemoteDataSource(client: mockClient);
  });

  group('Login Api Remote Data Source', () {
    test('should peform fetch & return response', () async {
      // arrange
      when(mockClient.post(
        Endpoints.login,
        body: loginBody.toMap(),
      )).thenAnswer((_) async => http.Response(loginResponseString, 200));
      // act
      final result = await remoteDataSource.login(loginBody);
      // assert
      expect(result, equals(loginResponse));
      verify(mockClient.post(
        Endpoints.login,
        body: loginBody.toMap(),
      ));
    });

    test(
      'should throw a RedirectionException when the server error',
      () async {
        // arrange
        when(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        )).thenThrow(RedirectionException(statusCode: 300, jsonBody: '{}'));
        // act
        final call = remoteDataSource.login;
        // assert
        expect(call(loginBody), throwsA(isA<RedirectionException>()));
        verify(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        ));
      },
    );

    test(
      'should throw a ClientException when the server error',
      () async {
        // arrange
        when(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        )).thenThrow(ClientException(statusCode: 400, jsonBody: '{}'));
        // act
        final call = remoteDataSource.login;
        // assert
        expect(call(loginBody), throwsA(isA<ClientException>()));
        verify(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        ));
      },
    );

    test(
      'should throw a ServerException when the server error',
      () async {
        // arrange
        when(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        )).thenThrow(ServerException(statusCode: 500, jsonBody: '{}'));
        // act
        final call = remoteDataSource.login;
        // assert
        expect(call(loginBody), throwsA(isA<ServerException>()));
        verify(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        ));
      },
    );

    test(
      'should throw a TimeoutException when the server error',
      () async {
        // arrange
        when(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        )).thenThrow(TimeoutException());
        // act
        final call = remoteDataSource.login;
        // assert
        expect(call(loginBody), throwsA(isA<TimeoutException>()));
        verify(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        ));
      },
    );

    test(
      'should throw a UnauthorizedException when the server error',
      () async {
        // arrange
        when(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        )).thenThrow(UnauthorizedException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.login;
        // assert
        expect(call(loginBody), throwsA(isA<UnauthorizedException>()));
        verify(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        ));
      },
    );

    test(
      'should throw a RefreshTokenException when the server error',
      () async {
        // arrange
        when(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        )).thenThrow(RefreshTokenException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.login;
        // assert
        expect(call(loginBody), throwsA(isA<RefreshTokenException>()));
        verify(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        ));
      },
    );

    test(
      'should throw a NoInternetException when the server error',
      () async {
        // arrange
        when(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        )).thenThrow(NoInternetException());
        // act
        final call = remoteDataSource.login;
        // assert
        expect(call(loginBody), throwsA(isA<NoInternetException>()));
        verify(mockClient.post(
          Endpoints.login,
          body: loginBody.toMap(),
        ));
      },
    );
  });

  group('Users Api Remote Data Source', () {
    test('should peform fetch & return response', () async {
      // arrange
      when(mockClient
              .get(Endpoints.users.replace(queryParameters: usersBody.toMap())))
          .thenAnswer((_) async => http.Response(usersResponseString, 200));
      // act
      final result = await remoteDataSource.users(usersBody);
      // assert
      expect(result, equals(usersResponse));
      verify(mockClient
          .get(Endpoints.users.replace(queryParameters: usersBody.toMap())));
    });

    test(
      'should throw a RedirectionException when the server error',
      () async {
        // arrange
        when(mockClient.get(
                Endpoints.users.replace(queryParameters: usersBody.toMap())))
            .thenThrow(RedirectionException(statusCode: 300, jsonBody: '{}'));
        // act
        final call = remoteDataSource.users;
        // assert
        expect(call(usersBody), throwsA(isA<RedirectionException>()));
        verify(mockClient
            .get(Endpoints.users.replace(queryParameters: usersBody.toMap())));
      },
    );

    test(
      'should throw a ClientException when the server error',
      () async {
        // arrange
        when(mockClient.get(
                Endpoints.users.replace(queryParameters: usersBody.toMap())))
            .thenThrow(ClientException(statusCode: 400, jsonBody: '{}'));
        // act
        final call = remoteDataSource.users;
        // assert
        expect(call(usersBody), throwsA(isA<ClientException>()));
        verify(mockClient
            .get(Endpoints.users.replace(queryParameters: usersBody.toMap())));
      },
    );

    test(
      'should throw a ServerException when the server error',
      () async {
        // arrange
        when(mockClient.get(
                Endpoints.users.replace(queryParameters: usersBody.toMap())))
            .thenThrow(ServerException(statusCode: 500, jsonBody: '{}'));
        // act
        final call = remoteDataSource.users;
        // assert
        expect(call(usersBody), throwsA(isA<ServerException>()));
        verify(mockClient
            .get(Endpoints.users.replace(queryParameters: usersBody.toMap())));
      },
    );

    test(
      'should throw a TimeoutException when the server error',
      () async {
        // arrange
        when(mockClient.get(
                Endpoints.users.replace(queryParameters: usersBody.toMap())))
            .thenThrow(TimeoutException());
        // act
        final call = remoteDataSource.users;
        // assert
        expect(call(usersBody), throwsA(isA<TimeoutException>()));
        verify(mockClient
            .get(Endpoints.users.replace(queryParameters: usersBody.toMap())));
      },
    );

    test(
      'should throw a UnauthorizedException when the server error',
      () async {
        // arrange
        when(mockClient.get(
                Endpoints.users.replace(queryParameters: usersBody.toMap())))
            .thenThrow(UnauthorizedException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.users;
        // assert
        expect(call(usersBody), throwsA(isA<UnauthorizedException>()));
        verify(mockClient
            .get(Endpoints.users.replace(queryParameters: usersBody.toMap())));
      },
    );

    test(
      'should throw a RefreshTokenException when the server error',
      () async {
        // arrange
        when(mockClient.get(
                Endpoints.users.replace(queryParameters: usersBody.toMap())))
            .thenThrow(RefreshTokenException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.users;
        // assert
        expect(call(usersBody), throwsA(isA<RefreshTokenException>()));
        verify(mockClient
            .get(Endpoints.users.replace(queryParameters: usersBody.toMap())));
      },
    );

    test(
      'should throw a NoInternetException when the server error',
      () async {
        // arrange
        when(mockClient.get(
                Endpoints.users.replace(queryParameters: usersBody.toMap())))
            .thenThrow(NoInternetException());
        // act
        final call = remoteDataSource.users;
        // assert
        expect(call(usersBody), throwsA(isA<NoInternetException>()));
        verify(mockClient
            .get(Endpoints.users.replace(queryParameters: usersBody.toMap())));
      },
    );
  });

  group('Products Api Remote Data Source', () {
    test('should peform fetch & return response', () async {
      // arrange
      when(mockClient.get(Endpoints.products
              .replace(queryParameters: productsBody.toMap())))
          .thenAnswer((_) async => http.Response(productsResponseString, 200));
      // act
      final result = await remoteDataSource.products(productsBody);
      // assert
      expect(result, equals(productsResponse));
      verify(mockClient.get(
          Endpoints.products.replace(queryParameters: productsBody.toMap())));
    });

    test(
      'should throw a RedirectionException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.products
                .replace(queryParameters: productsBody.toMap())))
            .thenThrow(RedirectionException(statusCode: 300, jsonBody: '{}'));
        // act
        final call = remoteDataSource.products;
        // assert
        expect(call(productsBody), throwsA(isA<RedirectionException>()));
        verify(mockClient.get(
            Endpoints.products.replace(queryParameters: productsBody.toMap())));
      },
    );

    test(
      'should throw a ClientException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.products
                .replace(queryParameters: productsBody.toMap())))
            .thenThrow(ClientException(statusCode: 400, jsonBody: '{}'));
        // act
        final call = remoteDataSource.products;
        // assert
        expect(call(productsBody), throwsA(isA<ClientException>()));
        verify(mockClient.get(
            Endpoints.products.replace(queryParameters: productsBody.toMap())));
      },
    );

    test(
      'should throw a ServerException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.products
                .replace(queryParameters: productsBody.toMap())))
            .thenThrow(ServerException(statusCode: 500, jsonBody: '{}'));
        // act
        final call = remoteDataSource.products;
        // assert
        expect(call(productsBody), throwsA(isA<ServerException>()));
        verify(mockClient.get(
            Endpoints.products.replace(queryParameters: productsBody.toMap())));
      },
    );

    test(
      'should throw a TimeoutException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.products
                .replace(queryParameters: productsBody.toMap())))
            .thenThrow(TimeoutException());
        // act
        final call = remoteDataSource.products;
        // assert
        expect(call(productsBody), throwsA(isA<TimeoutException>()));
        verify(mockClient.get(
            Endpoints.products.replace(queryParameters: productsBody.toMap())));
      },
    );

    test(
      'should throw a UnauthorizedException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.products
                .replace(queryParameters: productsBody.toMap())))
            .thenThrow(UnauthorizedException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.products;
        // assert
        expect(call(productsBody), throwsA(isA<UnauthorizedException>()));
        verify(mockClient.get(
            Endpoints.products.replace(queryParameters: productsBody.toMap())));
      },
    );

    test(
      'should throw a RefreshTokenException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.products
                .replace(queryParameters: productsBody.toMap())))
            .thenThrow(RefreshTokenException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.products;
        // assert
        expect(call(productsBody), throwsA(isA<RefreshTokenException>()));
        verify(mockClient.get(
            Endpoints.products.replace(queryParameters: productsBody.toMap())));
      },
    );

    test(
      'should throw a NoInternetException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.products
                .replace(queryParameters: productsBody.toMap())))
            .thenThrow(NoInternetException());
        // act
        final call = remoteDataSource.products;
        // assert
        expect(call(productsBody), throwsA(isA<NoInternetException>()));
        verify(mockClient.get(
            Endpoints.products.replace(queryParameters: productsBody.toMap())));
      },
    );
  });

  group('Product Api Remote Data Source', () {
    test('should peform fetch & return response', () async {
      // arrange
      when(mockClient.get(Endpoints.product(productBody.id.toString())))
          .thenAnswer((_) async => http.Response(productResponseString, 200));
      // act
      final result = await remoteDataSource.product(productBody);
      // assert
      expect(result, equals(productResponse));
      verify(mockClient.get(Endpoints.product(productBody.id.toString())));
    });

    test(
      'should throw a RedirectionException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.product(productBody.id.toString())))
            .thenThrow(RedirectionException(statusCode: 300, jsonBody: '{}'));
        // act
        final call = remoteDataSource.product;
        // assert
        expect(call(productBody), throwsA(isA<RedirectionException>()));
        verify(mockClient.get(Endpoints.product(productBody.id.toString())));
      },
    );

    test(
      'should throw a ClientException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.product(productBody.id.toString())))
            .thenThrow(ClientException(statusCode: 400, jsonBody: '{}'));
        // act
        final call = remoteDataSource.product;
        // assert
        expect(call(productBody), throwsA(isA<ClientException>()));
        verify(mockClient.get(Endpoints.product(productBody.id.toString())));
      },
    );

    test(
      'should throw a ServerException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.product(productBody.id.toString())))
            .thenThrow(ServerException(statusCode: 500, jsonBody: '{}'));
        // act
        final call = remoteDataSource.product;
        // assert
        expect(call(productBody), throwsA(isA<ServerException>()));
        verify(mockClient.get(Endpoints.product(productBody.id.toString())));
      },
    );

    test(
      'should throw a TimeoutException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.product(productBody.id.toString())))
            .thenThrow(TimeoutException());
        // act
        final call = remoteDataSource.product;
        // assert
        expect(call(productBody), throwsA(isA<TimeoutException>()));
        verify(mockClient.get(Endpoints.product(productBody.id.toString())));
      },
    );

    test(
      'should throw a UnauthorizedException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.product(productBody.id.toString())))
            .thenThrow(UnauthorizedException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.product;
        // assert
        expect(call(productBody), throwsA(isA<UnauthorizedException>()));
        verify(mockClient.get(Endpoints.product(productBody.id.toString())));
      },
    );

    test(
      'should throw a RefreshTokenException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.product(productBody.id.toString())))
            .thenThrow(RefreshTokenException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.product;
        // assert
        expect(call(productBody), throwsA(isA<RefreshTokenException>()));
        verify(mockClient.get(Endpoints.product(productBody.id.toString())));
      },
    );

    test(
      'should throw a NoInternetException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.product(productBody.id.toString())))
            .thenThrow(NoInternetException());
        // act
        final call = remoteDataSource.product;
        // assert
        expect(call(productBody), throwsA(isA<NoInternetException>()));
        verify(mockClient.get(Endpoints.product(productBody.id.toString())));
      },
    );
  });

  group('Carts Api Remote Data Source', () {
    test('should peform fetch & return response', () async {
      // arrange
      when(mockClient.get(Endpoints.carts(cartsBody.userId.toString())))
          .thenAnswer((_) async => http.Response(cartsResponseString, 200));
      // act
      final result = await remoteDataSource.carts(cartsBody);
      // assert
      expect(result, equals(cartsResponse));
      verify(mockClient.get(Endpoints.carts(cartsBody.userId.toString())));
    });

    test(
      'should throw a RedirectionException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.carts(cartsBody.userId.toString())))
            .thenThrow(RedirectionException(statusCode: 300, jsonBody: '{}'));
        // act
        final call = remoteDataSource.carts;
        // assert
        expect(call(cartsBody), throwsA(isA<RedirectionException>()));
        verify(mockClient.get(Endpoints.carts(cartsBody.userId.toString())));
      },
    );

    test(
      'should throw a ClientException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.carts(cartsBody.userId.toString())))
            .thenThrow(ClientException(statusCode: 400, jsonBody: '{}'));
        // act
        final call = remoteDataSource.carts;
        // assert
        expect(call(cartsBody), throwsA(isA<ClientException>()));
        verify(mockClient.get(Endpoints.carts(cartsBody.userId.toString())));
      },
    );

    test(
      'should throw a ServerException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.carts(cartsBody.userId.toString())))
            .thenThrow(ServerException(statusCode: 500, jsonBody: '{}'));
        // act
        final call = remoteDataSource.carts;
        // assert
        expect(call(cartsBody), throwsA(isA<ServerException>()));
        verify(mockClient.get(Endpoints.carts(cartsBody.userId.toString())));
      },
    );

    test(
      'should throw a TimeoutException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.carts(cartsBody.userId.toString())))
            .thenThrow(TimeoutException());
        // act
        final call = remoteDataSource.carts;
        // assert
        expect(call(cartsBody), throwsA(isA<TimeoutException>()));
        verify(mockClient.get(Endpoints.carts(cartsBody.userId.toString())));
      },
    );

    test(
      'should throw a UnauthorizedException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.carts(cartsBody.userId.toString())))
            .thenThrow(UnauthorizedException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.carts;
        // assert
        expect(call(cartsBody), throwsA(isA<UnauthorizedException>()));
        verify(mockClient.get(Endpoints.carts(cartsBody.userId.toString())));
      },
    );

    test(
      'should throw a RefreshTokenException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.carts(cartsBody.userId.toString())))
            .thenThrow(RefreshTokenException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.carts;
        // assert
        expect(call(cartsBody), throwsA(isA<RefreshTokenException>()));
        verify(mockClient.get(Endpoints.carts(cartsBody.userId.toString())));
      },
    );

    test(
      'should throw a NoInternetException when the server error',
      () async {
        // arrange
        when(mockClient.get(Endpoints.carts(cartsBody.userId.toString())))
            .thenThrow(NoInternetException());
        // act
        final call = remoteDataSource.carts;
        // assert
        expect(call(cartsBody), throwsA(isA<NoInternetException>()));
        verify(mockClient.get(Endpoints.carts(cartsBody.userId.toString())));
      },
    );
  });
}
