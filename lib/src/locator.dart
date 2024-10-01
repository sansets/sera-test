import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sera_test/routes.dart';
import 'package:sera_test/src/data/datasources/network/remote_data_source.dart';
import 'package:sera_test/src/data/repository/app_repository_impl.dart';
import 'package:sera_test/src/domain/repositories/app_repository.dart';
import 'package:sera_test/src/presentation/carts/cart_locator.dart';
import 'package:sera_test/src/presentation/product_detail/product_detail_locator.dart';
import 'package:sera_test/src/presentation/product_list/product_list_locator.dart';
import 'package:sera_test/src/presentation/sign_in/sign_in_locator.dart';
import 'package:sera_test/src/util/global_variable.dart';

void setupLocator() {
  // *Router
  locator.registerLazySingleton(() => Routes.router);

  // *Storage
  locator.registerLazySingleton(() => const FlutterSecureStorage());

  // *Http
  locator.registerLazySingleton(() => http.Client());

  // *Repository
  locator.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(remoteDataSource: locator()),
  );
  // *Datasource
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSource(client: locator()),
  );

  setupLocatorSignIn();
  setupLocatorProductList();
  setupLocatorProductDetail();
  setupLocatorCart();
}
