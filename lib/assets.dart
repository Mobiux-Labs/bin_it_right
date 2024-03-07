import 'package:reseacue/utils/utils.dart';

const List<String> vehicles = [
  AssetConstants.vehicleS,
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

  static const String leftGrass = 'left_side_grass.png';
  static const String rightGrass = 'right_side_grass.png';

  static const String road = 'road.png';
  static const String roadStripes = 'road_stripes.png';

  static const String vehicleS = 'vehicle_1.png';
}
