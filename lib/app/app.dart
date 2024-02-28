import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reseacue/constants/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppRoutes.routes,
    );
  }
}
