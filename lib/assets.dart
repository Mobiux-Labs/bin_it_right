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

const List<String> wetWasteMovingVehicle = [
  AssetConstants.wetWasteVehicleMoving1,
  AssetConstants.wetWasteVehicleMoving2,
];

const List<String> dryWasteMovingVehicle = [
  AssetConstants.dryWasteVehicleMoving1,
  AssetConstants.dryWasteVehicleMoving2,
];

const List<String> bothWasteMovingVehicle = [
  AssetConstants.bothWasteVehicleMoving1,
  AssetConstants.bothWasteVehicleMoving2,
];

const List<String> grassVariations = [
  AssetConstants.leftGrass,
  AssetConstants.rightGrass,
];

List<String> sprites = [
  AssetConstants.splashScreen,
  ...getBuildingVariationImages(),
  ...getWasteDropAnimationImages(),
  ...getIdleGiftAnimationImages(),
  ...getOpeningGiftAnimationImages(),
  ...wetWasteMovingVehicle,
  ...dryWasteMovingVehicle,
  ...bothWasteMovingVehicle,
  ...vehicles,
  ...idleVehicleS,
  ...movingVehicleS,
  ...grassVariations,
  ...getWasteVariationImages(),
  AssetConstants.road,
  AssetConstants.roadStripes,
  AssetConstants.earthToken,
  AssetConstants.magneticField,
  AssetConstants.magnet,
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
  static const String wetWasteVehicleMoving1 = 'wet_waste_vehicle_1.png';
  static const String wetWasteVehicleMoving2 = 'wet_waste_vehicle_2.png';
  static const String dryWasteVehicleMoving1 = 'dry_waste_vehicle_1.png';
  static const String dryWasteVehicleMoving2 = 'dry_waste_vehicle_2.png';
  static const String bothWasteVehicleMoving1 = 'both_waste_vehicle_1.png';
  static const String bothWasteVehicleMoving2 = 'both_waste_vehicle_2.png';

  static const String earthToken = 'earth_token.png';
  static const String leaderboard = 'leaderboard_icon.png';
  static const String pause = 'pause_icon.png';
  static const String settings = 'settings_icon.png';

  static const String magneticField = 'magnetic_field.png';
  static const String magnet = 'magnet.png';
}
