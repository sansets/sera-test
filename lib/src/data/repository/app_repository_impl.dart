import 'package:sera_test/src/data/datasources/network/model/demo_exception.dart';
import 'package:sera_test/src/data/datasources/network/model/demo_failure.dart';
import 'package:sera_test/src/data/datasources/network/remote_data_source.dart';
import 'package:sera_test/src/data/models/body/carts_body.dart';
import 'package:sera_test/src/data/models/body/login_body.dart';
import 'package:sera_test/src/data/models/body/product_body.dart';
import 'package:sera_test/src/data/models/body/products_body.dart';
import 'package:sera_test/src/data/models/body/users_body.dart';
import 'package:sera_test/src/data/models/mapper/login_mapper.dart';
import 'package:sera_test/src/data/models/mapper/product_mapper.dart';
import 'package:sera_test/src/data/models/mapper/user_mapper.dart';
import 'package:sera_test/src/domain/entities/cart_entity.dart';
import 'package:sera_test/src/domain/entities/cart_product_entity.dart';
import 'package:sera_test/src/domain/entities/login_entity.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';
import 'package:sera_test/src/domain/entities/user_entity.dart';
import 'package:sera_test/src/domain/repositories/app_repository.dart';
import 'package:sera_test/src/util/either.dart';

class AppRepositoryImpl implements AppRepository {
  AppRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<DemoFailure, LoginEntity>> login(LoginBody body) async {
    try {
      final data = await remoteDataSource.login(body);
      return Right(data.toEntity());
    } on DemoException catch (e) {
      return Left(e.toDemoFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }

  @override
  Future<Either<DemoFailure, List<UserEntity>>> users(UsersBody body) async {
    try {
      final data = await remoteDataSource.users(body);
      return Right(data.map((e) => e.toEntity()).toList());
    } on DemoException catch (e) {
      return Left(e.toDemoFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }

  @override
  Future<Either<DemoFailure, List<ProductEntity>>> products(
      ProductsBody body) async {
    try {
      final data = await remoteDataSource.products(body);
      return Right(data.map((e) => e.toEntity()).toList());
    } on DemoException catch (e) {
      return Left(e.toDemoFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }

  @override
  Future<Either<DemoFailure, ProductEntity>> product(ProductBody body) async {
    try {
      final data = await remoteDataSource.product(body);
      return Right(data.toEntity());
    } on DemoException catch (e) {
      return Left(e.toDemoFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }

  @override
  Future<Either<DemoFailure, CartEntity>> carts(CartsBody body) async {
    try {
      final cartResponse = await remoteDataSource.carts(body);
      final products = await remoteDataSource.products(const ProductsBody());

      final lastCartResponse = cartResponse.last;
      final cartProducts = lastCartResponse.products ?? [];
      final cartEntity = CartEntity(
        id: lastCartResponse.id,
        cartProducts: cartProducts
            .map((e) => CartProductEntity(
                  product: products
                      .firstWhere((product) => product.id == e.productId)
                      .toEntity(),
                  quantity: e.quantity,
                ))
            .toList(),
      );

      return Right(cartEntity);
    } on DemoException catch (e) {
      return Left(e.toDemoFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }
}
