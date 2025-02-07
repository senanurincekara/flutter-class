abstract class DataState<T> {
  final T? data;
  //T generik bir türdür, yani farklı veri türlerine sahip nesneler bu sınıf ile çalışabilir.
  final String? error;

  const DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T? data) : super(data, null);
}

class DataFailed<T> extends DataState {
  const DataFailed(String error) : super(null, error);
}


//Veri Durumu Yönetimi (State Management) için kullanılan DataState sınıfını
// ve onun türevlerini tanımlar. 
//Bu yapıyı kullanarak bir verinin başarılı ya da başarısız olma durumlarını