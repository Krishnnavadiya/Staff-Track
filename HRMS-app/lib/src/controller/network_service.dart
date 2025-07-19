import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  final connectivity = Connectivity();
  late final StreamSubscription<ConnectivityResult> subscription;

  Rx<bool> isNetworkAvailable = false.obs;

  @override
  void onInit() {
    super.onInit();
    subscription = connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        isNetworkAvailable.value = true;
        log('Internet connection available 😁');
      } else {
        isNetworkAvailable.value = false;
        log('Internet connection not available 😒');
      }
    });
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }
}
