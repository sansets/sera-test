import 'package:sera_test/src/data/datasources/network/model/demo_failure.dart';
import 'package:sera_test/src/data/models/body/carts_body.dart';
import 'package:sera_test/src/data/models/body/login_body.dart';
import 'package:sera_test/src/data/models/body/product_body.dart';
import 'package:sera_test/src/data/models/body/products_body.dart';
import 'package:sera_test/src/data/models/body/users_body.dart';
import 'package:sera_test/src/domain/entities/cart_entity.dart';
import 'package:sera_test/src/domain/entities/login_entity.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';
import 'package:sera_test/src/domain/entities/user_entity.dart';
import 'package:sera_test/src/util/either.dart';

abstract class AppRepository {
  Future<Either<DemoFailure, LoginEntity>> login(LoginBody body);
  Future<Either<DemoFailure, List<UserEntity>>> users(UsersBody body);
  Future<Either<DemoFailure, List<ProductEntity>>> products(ProductsBody body);
  Future<Either<DemoFailure, ProductEntity>> product(ProductBody body);
  Future<Either<DemoFailure, CartEntity>> carts(CartsBody body);
}
