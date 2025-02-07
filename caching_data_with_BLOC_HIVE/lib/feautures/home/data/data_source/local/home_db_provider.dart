//databese provider to utilize home databese services and
//implement them in home repositories later stages

import 'package:cache/core/helper/log_helper.dart';
import 'package:cache/feautures/home/data/data_source/local/home_db_services.dart';
import 'package:cache/feautures/home/data/model/product_model.dart';

class HomeDbProvider {
  final HomeDataBaseService _homeDataBaseService;
  HomeDbProvider({required HomeDataBaseService homeDataBaseService})
      : _homeDataBaseService = homeDataBaseService;

  //Read from db
  Future<ProductModel?> getProducts() async {
    try {
      return await _homeDataBaseService.getAll();
    } catch (e) {
      logger.e("error retrieving Products: $e");
      return null;
    }
  }

  //insert to db
  Future<void> insertProducts({required ProductModel object}) async {
    try {
      await _homeDataBaseService.insertItem(object: object);
    } catch (e) {
      logger.e("error inserting products : $e");
    }
  }

  //is data available
  Future<bool> isProductsAvailable() async {
    return await _homeDataBaseService.isDataAvaliable();
  }
}


/*

HomeDataBaseService ile doğrudan iletişim kuran bir servis. 
Burası, uygulamanın iş mantığını yönetmek için kullanılıyor.


*/