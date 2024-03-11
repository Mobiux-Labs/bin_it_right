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

const List<String> lifeStates = [
  AssetConstants.alive,
  AssetConstants.lifeOver,
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
  static const String magneticField = 'magnetic_field.png';
  static const String magnet = 'magnet.png';
  static const String alive = 'alive.png';
  static const String lifeOver = 'life_over.png';
  static const String countdownFirst = 'countdown_1.png';
  static const String countdownSecond = 'countdown_2.png';
  static const String countdownThird = 'countdown_3.png';
  static const String liveover = 'life_over.png';
  static const String tutorialFirst = 'tutorial_1.png';
  static const String tutorialSecond = 'tutorial_2.png';
  static const String tutorialThird = 'tutorial_3.png';
  static const String tutorialFourth = 'tutorial_4.png';
  static const String tutorialFifth = 'tutorial_5.png';
  static const String tutorialSixth = 'tutorial_6.png';

  static const String treeAnimationFirstFrame = 'Tree animation_1.png';
  static const String treeAnimationSecondFrame = 'Tree animation_2.png';
  static const String treeAnimationThirdFrame = 'Tree animation_3.png';
  static const String treeAnimationFourthFrame = 'Tree animation_4.png';
  static const String treeAnimationFifthFrame = 'Tree animation_5.png';
  static const String treeAnimationSixthFrame = 'Tree animation_6.png';
  static const String treeAnimationSeventhFrame = 'Tree animation_7.png';
  static const String treeAnimationEighthFrame = 'Tree animation_8.png';
  static const String treeAnimationNinthFrame = 'Tree animation_9.png';
  static const String treeAnimationTenthFrame = 'Tree animation_10.png';
  static const String treeAnimationEleventhFrame = 'Tree animation_11.png';
  static const String treeAnimationTwelfthFrame = 'Tree animation_12.png';
  static const String treeAnimationThirteenthFrame = 'Tree animation_13.png';
  static const String treeAnimationFourteenthFrame = 'Tree animation_14.png';
  static const String treeAnimationFifteenthFrame = 'Tree animation_15.png';
  static const String treeAnimationSixteenthFrame = 'Tree animation_16.png';
  static const String treeAnimationSeventeenthFrame = 'Tree animation_17.png';
  static const String treeAnimationEighteenthFrame = 'Tree animation_18.png';
  static const String treeAnimationNineteenthFrame = 'Tree animation_19.png';
  static const String treeAnimationTwentiethFrame = 'Tree animation_20.png';
  static const String treeAnimationTwentyFirstFrame = 'Tree animation_21.png';
  static const String treeAnimationTwentySecondFrame = 'Tree animation_22.png';
  static const String treeAnimationTwentyThirdFrame = 'Tree animation_23.png';
  static const String treeAnimationTwentyFourthFrame = 'Tree animation_24.png';
  static const String treeAnimationTwentyFifthFrame = 'Tree animation_25.png';
  static const String treeAnimationTwentySixthFrame = 'Tree animation_26.png';
  static const String treeAnimationTwentySeventhFrame = 'Tree animation_27.png';
  static const String treeAnimationTwentyEighthFrame = 'Tree animation_28.png';
  static const String treeAnimationTwentyNinthFrame = 'Tree animation_29.png';
  static const String treeAnimationThirtiethFrame = 'Tree animation_30.png';
  static const String treeAnimationThirtyFirstFrame = 'Tree animation_31.png';
  static const String treeAnimationThirtySecondFrame = 'Tree animation_32.png';
  static const String treeAnimationThirtyThirdFrame = 'Tree animation_33.png';
  static const String treeAnimationThirtyFourthFrame = 'Tree animation_34.png';
  static const String treeAnimationThirtyFifthFrame = 'Tree animation_35.png';
  static const String treeAnimationThirtySixthFrame = 'Tree animation_36.png';
  static const String treeAnimationThirtySeventhFrame = 'Tree animation_37.png';
  static const String treeAnimationThirtyEighthFrame = 'Tree animation_38.png';
  static const String treeAnimationThirtyNinthFrame = 'Tree animation_39.png';
  static const String treeAnimationFortiethFrame = 'Tree animation_40.png';
  static const String treeAnimationFortyFirstFrame = 'Tree animation_41.png';
  static const String treeAnimationFortySecondFrame = 'Tree animation_42.png';
  static const String treeAnimationFortyThirdFrame = 'Tree animation_43.png';
  static const String treeAnimationFortyFourthFrame = 'Tree animation_44.png';
  static const String treeAnimationFortyFifthFrame = 'Tree animation_45.png';

  static const String splashLoading = 'splash_loading.png';

  static const List<String> treeAnimationFrames = [
    treeAnimationFirstFrame,
    treeAnimationSecondFrame,
    treeAnimationThirdFrame,
    treeAnimationFourthFrame,
    treeAnimationFifthFrame,
    treeAnimationSixthFrame,
    treeAnimationSeventhFrame,
    treeAnimationEighthFrame,
    treeAnimationNinthFrame,
    treeAnimationTenthFrame,
    treeAnimationEleventhFrame,
    treeAnimationTwelfthFrame,
    treeAnimationThirteenthFrame,
    treeAnimationFourteenthFrame,
    treeAnimationFifteenthFrame,
    treeAnimationSixteenthFrame,
    treeAnimationSeventeenthFrame,
    treeAnimationEighteenthFrame,
    treeAnimationNineteenthFrame,
    treeAnimationTwentiethFrame,
    treeAnimationTwentyFirstFrame,
    treeAnimationTwentySecondFrame,
    treeAnimationTwentyThirdFrame,
    treeAnimationTwentyFourthFrame,
    treeAnimationTwentyFifthFrame,
    treeAnimationTwentySixthFrame,
    treeAnimationTwentySeventhFrame,
    treeAnimationTwentyEighthFrame,
    treeAnimationTwentyNinthFrame,
    treeAnimationThirtiethFrame,
    treeAnimationThirtyFirstFrame,
    treeAnimationThirtySecondFrame,
    treeAnimationThirtyThirdFrame,
    treeAnimationThirtyFourthFrame,
    treeAnimationThirtyFifthFrame,
    treeAnimationThirtySixthFrame,
    treeAnimationThirtySeventhFrame,
    treeAnimationThirtyEighthFrame,
    treeAnimationThirtyNinthFrame,
    treeAnimationFortiethFrame,
    treeAnimationFortyFirstFrame,
    treeAnimationFortySecondFrame,
    treeAnimationFortyThirdFrame,
    treeAnimationFortyFourthFrame,
    treeAnimationFortyFifthFrame
  ];

  static const List<String> assets = [
    splashScreen,
    leftGrass,
    rightGrass,
    road,
    roadStripes,
    vehicleS,
    vehicleSIdle,
    vehicleSMoving1,
    vehicleSMoving2,
    wetWasteVehicleMoving1,
    wetWasteVehicleMoving2,
    dryWasteVehicleMoving1,
    dryWasteVehicleMoving2,
    bothWasteVehicleMoving1,
    bothWasteVehicleMoving2,
    earthToken,
    magneticField,
    magnet,
    alive,
    lifeOver,
    countdownFirst,
    countdownSecond,
    countdownThird,
    liveover,
    tutorialFirst,
    tutorialSecond,
    tutorialThird,
    tutorialFourth,
    tutorialFifth,
    tutorialSixth,
    treeAnimationFirstFrame,
    treeAnimationSecondFrame,
    treeAnimationThirdFrame,
    treeAnimationFourthFrame,
    treeAnimationFifthFrame,
    treeAnimationSixthFrame,
    treeAnimationSeventhFrame,
    treeAnimationEighthFrame,
    treeAnimationNinthFrame,
    treeAnimationTenthFrame,
    treeAnimationEleventhFrame,
    treeAnimationTwelfthFrame,
    treeAnimationThirteenthFrame,
    treeAnimationFourteenthFrame,
    treeAnimationFifteenthFrame,
    treeAnimationSixteenthFrame,
    treeAnimationSeventeenthFrame,
    treeAnimationEighteenthFrame,
    treeAnimationNineteenthFrame,
    treeAnimationTwentiethFrame,
    treeAnimationTwentyFirstFrame,
    treeAnimationTwentySecondFrame,
    treeAnimationTwentyThirdFrame,
    treeAnimationTwentyFourthFrame,
    treeAnimationTwentyFifthFrame,
    treeAnimationTwentySixthFrame,
    treeAnimationTwentySeventhFrame,
    treeAnimationTwentyEighthFrame,
    treeAnimationTwentyNinthFrame,
    treeAnimationThirtiethFrame,
    treeAnimationThirtyFirstFrame,
    treeAnimationThirtySecondFrame,
    treeAnimationThirtyThirdFrame,
    treeAnimationThirtyFourthFrame,
    treeAnimationThirtyFifthFrame,
    treeAnimationThirtySixthFrame,
    treeAnimationThirtySeventhFrame,
    treeAnimationThirtyEighthFrame,
    treeAnimationThirtyNinthFrame,
    treeAnimationFortiethFrame,
    treeAnimationFortyFirstFrame,
    treeAnimationFortySecondFrame,
    treeAnimationFortyThirdFrame,
    treeAnimationFortyFourthFrame,
    treeAnimationFortyFifthFrame,
    splashLoading,
  ];
}
