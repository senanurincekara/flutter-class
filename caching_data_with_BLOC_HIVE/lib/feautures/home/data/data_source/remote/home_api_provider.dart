import 'package:cache/config/constants/api_constants.dart';
import 'package:cache/core/helper/log_helper.dart';
import 'package:dio/dio.dart';

class HomeApiProvider {
  final Dio dio;
  HomeApiProvider(this.dio);

  // call home page products data

  dynamic callHomeProductsEndPoint() async {
    //requuest utl
    final requestUrl = EnvironmentVariables.getProducts;

    final response = await dio
        .request(requestUrl, options: Options(method: "GET"))
        .onError((DioException error, stackTrace) {
      logger.e(error.toString());
      throw error;
    });
    return response;
  }
}



//dio->HTTP istekleri yapmak için kullanılan güçlü ve esnek bir ağ istemcisidir.
// Genellikle REST API'lerinden veri almak, göndermek veya internetle iletişim 
//kurmak için kullanılır.