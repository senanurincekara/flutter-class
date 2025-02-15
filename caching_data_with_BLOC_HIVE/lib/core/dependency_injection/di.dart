import 'di_ex.dart';

GetIt di = GetIt.instance;
// di nesnesi, bağımlılıkları yönetmek için kullanılan GetIt'in tek bir örneğidir.

Future<void> setUpDi() async {
  //network services
  //Dio'yu tek bir nesne olarak kaydediyoruz,
  //böylece her seferinde yeni bir Dio nesnesi oluşturmaya gerek kalmaz.
  di.registerSingleton<Dio>(Dio());

  //helper -> İnternet bağlantısını kontrol etmek için InternetConnectionHelper nesnesini kaydettik.
  di.registerSingleton(InternetConnectionHelper());

  //hive databese
  await Hive.initFlutter();

  //DB services
  //Home databese services
  di.registerSingleton<HomeDataBaseService>(HomeDataBaseService());
  await di<HomeDataBaseService>().initDataBase();

  //DB provider
  // home database provider
  di.registerSingleton(
      HomeDbProvider(homeDataBaseService: di<HomeDataBaseService>()));

  //Api provider
  //home provider
  di.registerSingleton(HomeApiProvider(di<Dio>()));

  //repository
  // home repository
  di.registerSingleton(
      HomeRepository(di<HomeApiProvider>(), di<HomeDbProvider>()));

  //bloc
  di.registerSingleton<HomeBloc>(HomeBloc(di<HomeRepository>()));
}
