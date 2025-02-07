import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionHelper {
  // check if the device is conencted to the ınternet
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.vpn) {
      return true;
    }

    return false;
  }
}
