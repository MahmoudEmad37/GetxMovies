import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final RxBool hasConnection = true.obs;

  @override
  void onInit() {
    super.onInit();

    _connectivity.onConnectivityChanged.listen((event) async {
      if ([ConnectivityResult.mobile, ConnectivityResult.wifi]
          .contains(event[0])) {
        hasConnection.value = true;
      } else {
        hasConnection.value = false;
      }
    });
  }

  RxBool getConnectionStatus() {
    return hasConnection;
  }
}
