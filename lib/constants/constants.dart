export 'paths.dart';

class Constants {
  Constants._();

  static const double minimumBuildingSpawnArea = -400.0;
  static const double maximumBuildingSpawnArea = -200.0;

  static const double minimumGameSpeed = 0.5;
  static const double maximumGameSpeed = 2.5;

  static const double minimumVelocity = -60;
  static const double maximumVelocity = -299.41;

  static const double minimumBuildingSpawnRate = 3.0;
  static const double maximumBuildingSpawnRate = 0.6;

  static const int buildingVariations = 18;

  static const String mainLoggerKey = 'main.dart';
  static const String appLifecycleObserverLoggerKey = 'AppLifecycleObserver';
  static const String mainMenuLoggerKey = 'start_menu.dart';
  static const String audioControllerLoggerKey = 'AudioController';

  static const String mainMenuKey = 'main_menu';
  static const String splashScreenKey = 'SplashScreen';
  static const String homeScreenKey = 'HomeScreen';
}
