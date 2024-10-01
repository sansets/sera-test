import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sera_test/src/data/datasources/network/model/demo_exception.dart';
import 'package:sera_test/src/data/datasources/network/model/demo_failure.dart';
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
import 'package:sera_test/src/data/repository/app_repository_impl.dart';
import 'package:sera_test/src/domain/entities/cart_entity.dart';
import 'package:sera_test/src/domain/entities/cart_product_entity.dart';
import 'package:sera_test/src/domain/entities/login_entity.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';
import 'package:sera_test/src/domain/entities/rating_entity.dart';
import 'package:sera_test/src/domain/entities/user_entity.dart';
import 'package:sera_test/src/domain/repositories/app_repository.dart';
import 'package:sera_test/src/util/either.dart';

import 'app_repository_impl_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late AppRepository repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = AppRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('Login Api Repository', () {
    const loginBody = LoginBody(
      username: "johnd",
      password: "m38rmF\$",
    );
    const loginResponse = LoginResponse(
      token: "eyJhbGciOiJIUzI1NiIsInR",
    );
    const loginEntity = LoginEntity(
      token: "eyJhbGciOiJIUzI1NiIsInR",
    );

    test(
        'should return response data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.login(loginBody))
          .thenAnswer((_) async => loginResponse);
      // act
      final result = await repository.login(loginBody);
      // assert
      expect(result, equals(Right(loginEntity)));
      verify(mockRemoteDataSource.login(loginBody));
    });

    test(
      'should return redirection exception when the call to remote data source is unsuccessful',
      () async {
        final exception = RedirectionException(statusCode: 300, jsonBody: '{}');
        final failure = RedirectionFailure(
          exception.toString(),
          statusCode: 300,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.login(loginBody)).thenThrow(exception);
        // act
        final result = await repository.login(loginBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.login(loginBody));
      },
    );

    test(
      'should return client failure when the call to remote data source is unsuccessful',
      () async {
        final exception = ClientException(statusCode: 400, jsonBody: '{}');
        final failure = ClientFailure(
          exception.toString(),
          statusCode: 400,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.login(loginBody)).thenThrow(exception);
        // act
        final result = await repository.login(loginBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.login(loginBody));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        final exception = ServerException(statusCode: 500, jsonBody: '{}');
        final failure = ServerFailure(
          exception.toString(),
          statusCode: 500,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.login(loginBody)).thenThrow(exception);
        // act
        final result = await repository.login(loginBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.login(loginBody));
      },
    );

    test(
      'should return unauthorized failure when the call to remote data source is unsuccessful',
      () async {
        final exception =
            UnauthorizedException(statusCode: 401, jsonBody: '{}');
        final failure = UnauthorizedFailure(
          exception.toString(),
          statusCode: 401,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.login(loginBody)).thenThrow(exception);
        // act
        final result = await repository.login(loginBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.login(loginBody));
      },
    );

    test(
      'should return timeout failure when the call to remote data source is unsuccessful',
      () async {
        final exception = TimeoutException();
        final failure = TimeoutFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.login(loginBody)).thenThrow(exception);
        // act
        final result = await repository.login(loginBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.login(loginBody));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unsuccessful',
      () async {
        final exception = InternalException();
        final failure = InternalFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.login(loginBody)).thenThrow(exception);
        // act
        final result = await repository.login(loginBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.login(loginBody));
      },
    );

    test(
      'should return no internet failure when the call to remote data source is unsuccessful',
      () async {
        final exception = NoInternetException();
        final failure = NoInternetFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.login(loginBody)).thenThrow(exception);
        // act
        final result = await repository.login(loginBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.login(loginBody));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unknown exception',
      () async {
        final exception = Exception('unknown');
        final failure = InternalFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.login(loginBody)).thenThrow(exception);
        // act
        final result = await repository.login(loginBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.login(loginBody));
      },
    );
  });

  group('Users Api Repository', () {
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
    const usersEntity = [
      UserEntity(
        id: "1",
        username: "johnd",
        password: "m38rmF\$",
      ),
    ];

    test(
        'should return response data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.users(usersBody))
          .thenAnswer((_) async => usersResponse);
      // act
      final result = await repository.users(usersBody);
      // assert
      expect(result, equals(Right(usersEntity)));
      verify(mockRemoteDataSource.users(usersBody));
    });

    test(
      'should return redirection exception when the call to remote data source is unsuccessful',
      () async {
        final exception = RedirectionException(statusCode: 300, jsonBody: '{}');
        final failure = RedirectionFailure(
          exception.toString(),
          statusCode: 300,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.users(usersBody)).thenThrow(exception);
        // act
        final result = await repository.users(usersBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.users(usersBody));
      },
    );

    test(
      'should return client failure when the call to remote data source is unsuccessful',
      () async {
        final exception = ClientException(statusCode: 400, jsonBody: '{}');
        final failure = ClientFailure(
          exception.toString(),
          statusCode: 400,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.users(usersBody)).thenThrow(exception);
        // act
        final result = await repository.users(usersBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.users(usersBody));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        final exception = ServerException(statusCode: 500, jsonBody: '{}');
        final failure = ServerFailure(
          exception.toString(),
          statusCode: 500,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.users(usersBody)).thenThrow(exception);
        // act
        final result = await repository.users(usersBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.users(usersBody));
      },
    );

    test(
      'should return unauthorized failure when the call to remote data source is unsuccessful',
      () async {
        final exception =
            UnauthorizedException(statusCode: 401, jsonBody: '{}');
        final failure = UnauthorizedFailure(
          exception.toString(),
          statusCode: 401,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.users(usersBody)).thenThrow(exception);
        // act
        final result = await repository.users(usersBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.users(usersBody));
      },
    );

    test(
      'should return timeout failure when the call to remote data source is unsuccessful',
      () async {
        final exception = TimeoutException();
        final failure = TimeoutFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.users(usersBody)).thenThrow(exception);
        // act
        final result = await repository.users(usersBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.users(usersBody));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unsuccessful',
      () async {
        final exception = InternalException();
        final failure = InternalFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.users(usersBody)).thenThrow(exception);
        // act
        final result = await repository.users(usersBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.users(usersBody));
      },
    );

    test(
      'should return no internet failure when the call to remote data source is unsuccessful',
      () async {
        final exception = NoInternetException();
        final failure = NoInternetFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.users(usersBody)).thenThrow(exception);
        // act
        final result = await repository.users(usersBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.users(usersBody));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unknown exception',
      () async {
        final exception = Exception('unknown');
        final failure = InternalFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.users(usersBody)).thenThrow(exception);
        // act
        final result = await repository.users(usersBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.users(usersBody));
      },
    );
  });

  group('Products Api Repository', () {
    const productsBody = ProductsBody();
    const productsResponse = [
      ProductResponse(
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
      )
    ];
    const productsEntity = [
      ProductEntity(
        id: "1",
        title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        price: 109.95,
        category: "men's clothing",
        description:
            "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        rating: RatingEntity(
          rate: 3.9,
          count: 120,
        ),
      )
    ];

    test(
        'should return response data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.products(productsBody))
          .thenAnswer((_) async => productsResponse);
      // act
      final result = await repository.products(productsBody);
      // assert
      expect(result, equals(Right(productsEntity)));
      verify(mockRemoteDataSource.products(productsBody));
    });

    test(
      'should return redirection exception when the call to remote data source is unsuccessful',
      () async {
        final exception = RedirectionException(statusCode: 300, jsonBody: '{}');
        final failure = RedirectionFailure(
          exception.toString(),
          statusCode: 300,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.products(productsBody)).thenThrow(exception);
        // act
        final result = await repository.products(productsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.products(productsBody));
      },
    );

    test(
      'should return client failure when the call to remote data source is unsuccessful',
      () async {
        final exception = ClientException(statusCode: 400, jsonBody: '{}');
        final failure = ClientFailure(
          exception.toString(),
          statusCode: 400,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.products(productsBody)).thenThrow(exception);
        // act
        final result = await repository.products(productsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.products(productsBody));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        final exception = ServerException(statusCode: 500, jsonBody: '{}');
        final failure = ServerFailure(
          exception.toString(),
          statusCode: 500,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.products(productsBody)).thenThrow(exception);
        // act
        final result = await repository.products(productsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.products(productsBody));
      },
    );

    test(
      'should return unauthorized failure when the call to remote data source is unsuccessful',
      () async {
        final exception =
            UnauthorizedException(statusCode: 401, jsonBody: '{}');
        final failure = UnauthorizedFailure(
          exception.toString(),
          statusCode: 401,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.products(productsBody)).thenThrow(exception);
        // act
        final result = await repository.products(productsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.products(productsBody));
      },
    );

    test(
      'should return timeout failure when the call to remote data source is unsuccessful',
      () async {
        final exception = TimeoutException();
        final failure = TimeoutFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.products(productsBody)).thenThrow(exception);
        // act
        final result = await repository.products(productsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.products(productsBody));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unsuccessful',
      () async {
        final exception = InternalException();
        final failure = InternalFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.products(productsBody)).thenThrow(exception);
        // act
        final result = await repository.products(productsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.products(productsBody));
      },
    );

    test(
      'should return no internet failure when the call to remote data source is unsuccessful',
      () async {
        final exception = NoInternetException();
        final failure = NoInternetFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.products(productsBody)).thenThrow(exception);
        // act
        final result = await repository.products(productsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.products(productsBody));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unknown exception',
      () async {
        final exception = Exception('unknown');
        final failure = InternalFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.products(productsBody)).thenThrow(exception);
        // act
        final result = await repository.products(productsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.products(productsBody));
      },
    );
  });

  group('Product Api Repository', () {
    const productBody = ProductBody();
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
    const productEntity = ProductEntity(
      id: "1",
      title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      price: 109.95,
      category: "men's clothing",
      description:
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      rating: RatingEntity(
        rate: 3.9,
        count: 120,
      ),
    );

    test(
        'should return response data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.product(productBody))
          .thenAnswer((_) async => productResponse);
      // act
      final result = await repository.product(productBody);
      // assert
      expect(result, equals(Right(productEntity)));
      verify(mockRemoteDataSource.product(productBody));
    });

    test(
      'should return redirection exception when the call to remote data source is unsuccessful',
      () async {
        final exception = RedirectionException(statusCode: 300, jsonBody: '{}');
        final failure = RedirectionFailure(
          exception.toString(),
          statusCode: 300,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.product(productBody)).thenThrow(exception);
        // act
        final result = await repository.product(productBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.product(productBody));
      },
    );

    test(
      'should return client failure when the call to remote data source is unsuccessful',
      () async {
        final exception = ClientException(statusCode: 400, jsonBody: '{}');
        final failure = ClientFailure(
          exception.toString(),
          statusCode: 400,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.product(productBody)).thenThrow(exception);
        // act
        final result = await repository.product(productBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.product(productBody));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        final exception = ServerException(statusCode: 500, jsonBody: '{}');
        final failure = ServerFailure(
          exception.toString(),
          statusCode: 500,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.product(productBody)).thenThrow(exception);
        // act
        final result = await repository.product(productBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.product(productBody));
      },
    );

    test(
      'should return unauthorized failure when the call to remote data source is unsuccessful',
      () async {
        final exception =
            UnauthorizedException(statusCode: 401, jsonBody: '{}');
        final failure = UnauthorizedFailure(
          exception.toString(),
          statusCode: 401,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.product(productBody)).thenThrow(exception);
        // act
        final result = await repository.product(productBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.product(productBody));
      },
    );

    test(
      'should return timeout failure when the call to remote data source is unsuccessful',
      () async {
        final exception = TimeoutException();
        final failure = TimeoutFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.product(productBody)).thenThrow(exception);
        // act
        final result = await repository.product(productBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.product(productBody));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unsuccessful',
      () async {
        final exception = InternalException();
        final failure = InternalFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.product(productBody)).thenThrow(exception);
        // act
        final result = await repository.product(productBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.product(productBody));
      },
    );

    test(
      'should return no internet failure when the call to remote data source is unsuccessful',
      () async {
        final exception = NoInternetException();
        final failure = NoInternetFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.product(productBody)).thenThrow(exception);
        // act
        final result = await repository.product(productBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.product(productBody));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unknown exception',
      () async {
        final exception = Exception('unknown');
        final failure = InternalFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.product(productBody)).thenThrow(exception);
        // act
        final result = await repository.product(productBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.product(productBody));
      },
    );
  });

  group('Carts Api Repository', () {
    const productsBody = ProductsBody();
    const productsResponse = [
      ProductResponse(
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
      )
    ];

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
    const cartsEntity = CartEntity(
      id: 1,
      cartProducts: [
        CartProductEntity(
          product: ProductEntity(
            id: "1",
            title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
            price: 109.95,
            category: "men's clothing",
            description:
                "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
            image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
            rating: RatingEntity(
              rate: 3.9,
              count: 120,
            ),
          ),
          quantity: "4",
        ),
      ],
    );

    test(
        'should return response data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.carts(cartsBody))
          .thenAnswer((_) async => cartsResponse);
      when(mockRemoteDataSource.products(productsBody))
          .thenAnswer((_) async => productsResponse);
      // act
      final result = await repository.carts(cartsBody);
      // assert
      expect(result, equals(Right(cartsEntity)));
      verify(mockRemoteDataSource.carts(cartsBody));
    });

    test(
      'should return redirection exception when the call to remote data source is unsuccessful',
      () async {
        final exception = RedirectionException(statusCode: 300, jsonBody: '{}');
        final failure = RedirectionFailure(
          exception.toString(),
          statusCode: 300,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.carts(cartsBody)).thenThrow(exception);
        // act
        final result = await repository.carts(cartsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.carts(cartsBody));
      },
    );

    test(
      'should return client failure when the call to remote data source is unsuccessful',
      () async {
        final exception = ClientException(statusCode: 400, jsonBody: '{}');
        final failure = ClientFailure(
          exception.toString(),
          statusCode: 400,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.carts(cartsBody)).thenThrow(exception);
        // act
        final result = await repository.carts(cartsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.carts(cartsBody));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        final exception = ServerException(statusCode: 500, jsonBody: '{}');
        final failure = ServerFailure(
          exception.toString(),
          statusCode: 500,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.carts(cartsBody)).thenThrow(exception);
        // act
        final result = await repository.carts(cartsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.carts(cartsBody));
      },
    );

    test(
      'should return unauthorized failure when the call to remote data source is unsuccessful',
      () async {
        final exception =
            UnauthorizedException(statusCode: 401, jsonBody: '{}');
        final failure = UnauthorizedFailure(
          exception.toString(),
          statusCode: 401,
          jsonBody: '{}',
        );
        // arrange
        when(mockRemoteDataSource.carts(cartsBody)).thenThrow(exception);
        // act
        final result = await repository.carts(cartsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.carts(cartsBody));
      },
    );

    test(
      'should return timeout failure when the call to remote data source is unsuccessful',
      () async {
        final exception = TimeoutException();
        final failure = TimeoutFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.carts(cartsBody)).thenThrow(exception);
        // act
        final result = await repository.carts(cartsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.carts(cartsBody));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unsuccessful',
      () async {
        final exception = InternalException();
        final failure = InternalFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.carts(cartsBody)).thenThrow(exception);
        // act
        final result = await repository.carts(cartsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.carts(cartsBody));
      },
    );

    test(
      'should return no internet failure when the call to remote data source is unsuccessful',
      () async {
        final exception = NoInternetException();
        final failure = NoInternetFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.carts(cartsBody)).thenThrow(exception);
        // act
        final result = await repository.carts(cartsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.carts(cartsBody));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unknown exception',
      () async {
        final exception = Exception('unknown');
        final failure = InternalFailure(exception.toString());
        // arrange
        when(mockRemoteDataSource.carts(cartsBody)).thenThrow(exception);
        // act
        final result = await repository.carts(cartsBody);
        // assert
        expect(result, equals(Left(failure)));
        verify(mockRemoteDataSource.carts(cartsBody));
      },
    );
  });
}
