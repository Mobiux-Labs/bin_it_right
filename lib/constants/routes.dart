import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reseacue/app/ui/main_menu.dart';
import 'package:reseacue/constants/constants.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(
      name: '/',
      page: () => const MainMenu(key: Key(Constants.mainMenuKey)),
    ),
  ];
}
