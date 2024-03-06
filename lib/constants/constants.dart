export 'paths.dart';

class Constants {
  Constants._();

  static const double minimumBuildingSpawnArea = -400.0;
  static const double maximumBuildingSpawnArea = -200.0;

  static const double minimumGameSpeed = 1.0;
  static const double maximumGameSpeed = 3.0;

  static const double minimumVelocity = -117.65;
  static const double maximumVelocity = -360;

  static const double minimumBuildingSpawnRate = 1.3;
  static const double maximumBuildingSpawnRate = 0.8;

  static const int buildingVariations = 18;

  static const String mainLoggerKey = 'main.dart';
  static const String appLifecycleObserverLoggerKey = 'AppLifecycleObserver';
  static const String mainMenuLoggerKey = 'main_menu.dart';
  static const String audioControllerLoggerKey = 'AudioController';

  static const String mainMenuKey = 'main_menu';
  static const String splashScreenKey = 'SplashScreen';
  static const String homeScreenKey = 'HomeScreen';
}
