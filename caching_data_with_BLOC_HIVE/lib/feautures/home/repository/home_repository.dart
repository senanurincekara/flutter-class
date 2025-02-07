import 'package:cache/core/dependency_injection/di.dart';
import 'package:cache/core/helper/connection_helper.dart';
import 'package:cache/core/helper/log_helper.dart';
import 'package:cache/core/resources/data_state.dart';
import 'package:cache/feautures/home/data/data_source/local/home_db_provider.dart';
import 'package:cache/feautures/home/data/data_source/remote/home_api_provider.dart';
import 'package:cache/feautures/home/data/model/product_model.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  //Remote source
  final HomeApiProvider _apiProvider;

  //Local sources
  final HomeDbProvider _dbProvider;

  HomeRepository(this._apiProvider, this._dbProvider);

  //get products for home
  Future<DataState<dynamic>> fetchProducts() async {
    //check the internet connection
    final bool isConnected =
        await di<InternetConnectionHelper>().checkInternetConnection();

    final bool isDataBaseEmpty = await _dbProvider.isProductsAvailable();

    if (isConnected) {
      try {
        final Response response = await _apiProvider.callHomeProductsEndPoint();
        if (response.statusCode == 200 &&
            response.data["success"] == true &&
            (response.data["products"] as List).isNotEmpty) {
          ProductModel productsModel = ProductModel.fromJson(response.data);
          _dbProvider.insertProducts(object: productsModel);

          final ProductModel? cachedProduct = await _dbProvider.getProducts();

          return DataSuccess(cachedProduct);
        } else {
          if (!isDataBaseEmpty) {
            // we have cached data in db

            logger.d("Load [Products] from local databse");
            final ProductModel? localSourceResponse =
                await _dbProvider.getProducts();
            return DataSuccess(localSourceResponse);
          } else {
            return const DataFailed("unkown errır");
          }
        }
      } catch (e) {
        if (!isDataBaseEmpty) {
          // we have cached data in db

          logger.d("Load [Products] from local databse");
          final ProductModel? localSourceResponse =
              await _dbProvider.getProducts();
          return DataSuccess(localSourceResponse);
        } else {
          return const DataFailed("unkown errır");
        }
      }
    } else {
      // user internet connection is not safe - no internet connection
      if (!isDataBaseEmpty) {
        // we have cached data in db

        logger.d("Load [Products] from local databse");
        final ProductModel? localSourceResponse =
            await _dbProvider.getProducts();
        return DataSuccess(localSourceResponse);
      } else {
        return const DataFailed("no network connection");
      }
    }
  }
}
