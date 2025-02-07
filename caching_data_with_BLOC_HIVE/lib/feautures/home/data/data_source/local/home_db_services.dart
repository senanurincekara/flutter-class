import 'package:cache/config/constants/db_keys.dart';
import 'package:cache/core/helper/log_helper.dart';
import 'package:cache/core/repos/interface_repos.dart';
import 'package:cache/feautures/home/data/model/product_model.dart';
import 'package:hive/hive.dart';

class HomeDataBaseService implements InterfaceRepository<ProductModel> {
  //box key
  static const String _key = DbKeys.dbProducts;

  //Product box -> Hive kutusunu saklayan değişken
  late final Box<ProductModel> _productBox;

  // İnit db
  Future<void> initDataBase() async {
    try {
      Hive.registerAdapter(ProductModelAdapter());
      Hive.registerAdapter(ProductAdapter());
      _productBox = await Hive.openBox(_key);

      //Hive.registerAdapter → ProductModel'i Hive ile uyumlu hale getiriyor.
      //Hive.openBox(_key) → dbProducts adlı Hive kutusunu açıyor.

      logger.d("success on initializing databese for *ProductsModel*");
    } catch (e) {
      logger.e("erroe initializing databese for *ProductsModel*");
    }
  }

  @override
  Future<ProductModel?> getAll() async {
    try {
      if (_productBox.isOpen && _productBox.isNotEmpty) {
        return _productBox.get(_key);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> insertItem({required ProductModel object}) async {
    try {
      return _productBox.put(_key, object);
    } catch (e) {
      logger.e("error inserting into databese $e");
    }
  }

  @override
  Future<bool> isDataAvaliable() async {
    try {
      return _productBox.isEmpty;
    } catch (e) {
      logger.e("error checking if box is empty $e");
      return true;
    }
  }
}
