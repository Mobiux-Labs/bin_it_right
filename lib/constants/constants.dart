import 'dart:ui';

import 'package:flame/components.dart';

export 'paths.dart';

class Constants {
  Constants._();

  static const String mobiuxUrl = 'https://mobiux.in';

  static const int tokensPerWaste = 3;

  static const double minimumBuildingSpawnArea = -400.0;
  static const double maximumBuildingSpawnArea = -350.0;

  static const double minimumGameSpeed = 0.5;
  static const double maximumGameSpeed = 5.0;

  static const double minimumVelocity = -60;
  static const double maximumVelocity = -299.41;

  static const double minimumBuildingSpawnRate = 5.0;
  static const double maximumBuildingSpawnRate = 0.8;

  static const int buildingVariations = 18;

  static const double outOfScreenDeltaToRemoveObject = 100.0;
  static const double wasteRepositionAnimationSpeed = 0.2;
  static const double wasteRepositionAnimationSpeedOnMagnet = 0.4;

  static const double giftAnimationStepTime = 0.03;
  static const double giftAnimationScale = 0.5;

  static const double idleVehicleAnimationStepTime = 0.3;
  static const double idleVehicleAnimationScale = 0.5;

  static const double movingVehicleAnimationStepTime = 0.3;
  static const double movingVehicleAnimationScale = 1.0;

  static const double idleWasteAnimationStepTime = 0.3;
  static const double idleWasteAnimationScale = 1.0;

  static const double dropWasteAnimationStepTime = 0.03;
  static const double dropWasteAnimationScale = 0.5;

  static double buildingScale = 0.35;
  static double vehicleScale = 0.8;

  static double initialGameSpeed = 0.5;

  static const String mainLoggerKey = 'main.dart';
  static const String utilsNumberLoggerKey = 'utils/number.dart';
  static const String utilsImagesLoggerKey = 'utils/images.dart';
  static const String appLifecycleObserverLoggerKey = 'AppLifecycleObserver';
  static const String startGameOverlayLoggerKey = 'start_menu.dart';
  static const String audioControllerLoggerKey = 'AudioController';
  static const String wasteLoggerKey = 'Waste';
  static const String vehicleLoggerKey = 'Vehicle';
  static const String giftLoggerKey = 'Gift';
  static const String gameLoggerKey = 'Game';

  static const String startGameOverlayKey = 'main_menu';
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
  static const double gameSpeedLevel2 = 1.2;
  static const double gameSpeedLevel3 = 1.4;
  static const double gameSpeedLevel4 = 1.6;

  static const Color greenButtonContainerColor = Color.fromRGBO(
    147,
    173,
    43,
    1,
  );
  static const Color greenButtonShadowContainerColor = Color.fromRGBO(
    185,
    195,
    65,
    1,
  );
  static const Color greenButtonShineColor = Color.fromRGBO(
    147,
    173,
    43,
    0.5,
  );

  static const Color redButtonContainerColor = Color.fromRGBO(
    204,
    37,
    0,
    1,
  );
  static const Color redButtonShadowContainerColor = Color.fromRGBO(
    255,
    91,
    36,
    1,
  );
  static const Color redButtonShineColor = Color.fromRGBO(
    204,
    37,
    0,
    0.5,
  );

  static const Color yellowButtonContainerColor = Color.fromRGBO(
    212,
    175,
    19,
    1,
  );
  static const Color yellowButtonShadowContainerColor = Color.fromRGBO(
    251,
    206,
    19,
    1,
  );
  static const Color yellowButtonShineColor = Color.fromRGBO(
    212,
    175,
    19,
    0.5,
  );

  static const double giftSpawnInterval = 45.0;

  static const double powerUpInterval = 45.0;
  static const double powerUpAvailableTimeInSeconds = 3.0;
  static const double defaultPowerUpLifespan = 5.0;
  static const double powerUpGameSpeed = 5.0;

  List<String> recyclingFacts = [
    "Recycling one ton of paper saves 17 trees, 7,000 gallons of water, and 380 gallons of oil.",
    "Plastic bottles can take up to 450 years to decompose in a landfill, but recycling them can save energy equivalent to powering a house for 6 months.",
    "Aluminum cans can be recycled infinitely without losing quality, and recycling one can saves enough energy to power a TV for 3 hours.",
    "Recycling glass reduces air pollution by 20% and water pollution by 50% compared to manufacturing new glass.",
    "E-waste contains valuable materials like gold and silver, and recycling one million laptops saves the energy equivalent to the electricity used by 3,500 homes in a year.",
    "In the United States, recycling and composting prevent the emission of over 186 million metric tons of carbon dioxide equivalent, equivalent to removing 40 million cars from the road annually.",
    "Producing new plastic from recycled material uses only two-thirds of the energy required to manufacture it from raw materials.",
    "The energy saved from recycling one plastic bottle can power a computer for 25 minutes.",
    "Recycling aluminum saves 95% of the energy needed to produce new aluminum from raw materials.",
    "Paper can decompose in a landfill, but it releases methane, a potent greenhouse gas; recycling paper reduces methane emissions and conserves landfill space."
  ];
}
