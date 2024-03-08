import 'dart:ui';

import 'package:flame/components.dart';

export 'paths.dart';

class Constants {
  Constants._();

  static const double minimumBuildingSpawnArea = -400.0;
  static const double maximumBuildingSpawnArea = -300.0;

  static const double minimumGameSpeed = 0.5;
  static const double maximumGameSpeed = 2.5;

  static const double minimumVelocity = -60;
  static const double maximumVelocity = -299.41;

  static const double minimumBuildingSpawnRate = 3.0;
  static const double maximumBuildingSpawnRate = 0.8;

  static const int buildingVariations = 18;

  static const double outOfScreenDeltaToRemoveObject = 100.0;
  static const double wasteRepositionAnimationSpeed = 0.1;

  static const double giftAnimationStepTime = 0.3;
  static const double giftAnimationScale = 0.5;

  static const double idleVehicleAnimationStepTime = 0.3;
  static const double idleVehicleAnimationScale = 0.5;

  static const double movingVehicleAnimationStepTime = 0.3;
  static const double movingVehicleAnimationScale = 1.0;

  static const double idleWasteAnimationStepTime = 0.3;
  static const double idleWasteAnimationScale = 1.0;

  static double buildingScale = 0.35;
  static double vehicleScale = 0.8;

  static double initialGameSpeed = 0.5;

  static const String mainLoggerKey = 'main.dart';
  static const String utilsNumberLoggerKey = 'utils/number.dart';
  static const String utilsImagesLoggerKey = 'utils/images.dart';
  static const String appLifecycleObserverLoggerKey = 'AppLifecycleObserver';
  static const String mainMenuLoggerKey = 'start_menu.dart';
  static const String audioControllerLoggerKey = 'AudioController';
  static const String wasteLoggerKey = 'Waste';
  static const String vehicleLoggerKey = 'Vehicle';
  static const String giftLoggerKey = 'Gift';
  static const String gameLoggerKey = 'Game';

  static const String mainMenuKey = 'main_menu';
  static const String splashScreenKey = 'SplashScreen';
  static const String homeScreenKey = 'HomeScreen';

  static const Color backgroundColor = Color(0xFFE7DFC1);

  static const double roadRenderPercentage = 41.0;

  static Vector2 leftWasteSpawnDelta = Vector2(30.0, 30.0);
  static Vector2 rightWasteSpawnDelta = Vector2(-30.0, 30.0);

  static const double vehicleSpawnDeltaFromBottom = 12.0;

  static const int gameSpeedUpTimeLevel1 = 10;
  static const int gameSpeedUpTimeLevel2 = 20;
  static const int gameSpeedUpTimeLevel3 = 30;
  static const int gameSpeedUpTimeLevel4 = 40;

  static const double gameSpeedLevel1 = 1.0;
  static const double gameSpeedLevel2 = 1.5;
  static const double gameSpeedLevel3 = 2.0;
  static const double gameSpeedLevel4 = 2.5;
}
