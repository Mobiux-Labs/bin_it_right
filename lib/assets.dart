import 'package:reseacue/utils/utils.dart';

const List<String> vehicles = [
  AssetConstants.vehicleS,
];

const List<String> idleVehicleS = [
  AssetConstants.vehicleSIdle,
];

const List<String> movingVehicleS = [
  AssetConstants.vehicleSMoving1,
  AssetConstants.vehicleSMoving2,
];

const List<String> grassVariations = [
  AssetConstants.leftGrass,
  AssetConstants.rightGrass,
];

const List<String> wasteVariations = [
  AssetConstants.wetWaste,
  AssetConstants.dryWaste,
];

List<String> sprites = [
  AssetConstants.splashScreen,
  ...getBuildingVariationImages(),
  ...getIdleGiftAnimationImages(),
  ...getOpeningGiftAnimationImages(),
  ...vehicles,
  ...idleVehicleS,
  ...movingVehicleS,
  ...grassVariations,
  ...wasteVariations,
  AssetConstants.road,
  AssetConstants.roadStripes,
];

class AssetConstants {
  AssetConstants._();

  static const String splashScreen = 'splash_screen.png';

  static const String wetWaste = 'wet_waste.png';
  static const String dryWaste = 'dry_waste.png';

  static const String leftGrass = 'grass_left_side.png';
  static const String rightGrass = 'grass_right_side.png';

  static const String road = 'road.png';
  static const String roadStripes = 'road_stripes.png';

  static const String vehicleS = 'vehicle_1.png';
  static const String vehicleSIdle = 'idle_vehicle.png';
  static const String vehicleSMoving1 = 'moving_vehicle_1.png';
  static const String vehicleSMoving2 = 'moving_vehicle_2.png';

  static const String earthToken = 'earth_token.png';
  static const String leaderboard = 'leaderboard_icon.png';
  static const String pause = 'pause_icon.png';
  static const String settings = 'settings_icon.png';
}
