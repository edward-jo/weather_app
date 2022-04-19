import 'package:connectivity_plus/connectivity_plus.dart';

mixin InternetChecking {
  Future<void> makeErrorInInternetNotAvailableCase() async {
    var status = await Connectivity().checkConnectivity();
    if (status != ConnectivityResult.wifi &&
        status != ConnectivityResult.mobile) {
      return Future.error('Internet Not Available');
    }
    return;
  }
}
