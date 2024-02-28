import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLifecycleController extends GetxController {
  var lifecycleState = (AppLifecycleState.inactive).obs;

  void updateLifecycleState(AppLifecycleState state) {
    lifecycleState.value = state;
  }
}
