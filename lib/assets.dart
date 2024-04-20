import 'package:reseacue/utils/utils.dart';

const List<String> vehicles = [
  AssetConstants.vehicleSkin1,
];

const List<String> idleVehicleS = [
  AssetConstants.idleVehicleSkin1,
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
  ...getBatteryOpeningGiftAnimationImages(),
  ...getPhoneOpeningGiftAnimationImages(),
  ...vehicles,
  ...idleVehicleS,
  ...grassVariations,
  ...getWasteVariationImages(),
  AssetConstants.road,
  AssetConstants.roadStripes,
  AssetConstants.earthToken,
  AssetConstants.magneticField,
  AssetConstants.magnet,
  AssetConstants.movingVehicleSkin11,
  AssetConstants.movingVehicleSkin12,
  AssetConstants.wetWasteVehicleSkin11,
  AssetConstants.wetWasteVehicleSkin12,
  AssetConstants.dryWasteVehicleSkin11,
  AssetConstants.dryWasteVehicleSkin12,
  AssetConstants.bothWasteVehicleSkin11,
  AssetConstants.bothWasteVehicleSkin12,
  AssetConstants.movingVehicleSkin21,
  AssetConstants.movingVehicleSkin22,
  AssetConstants.wetWasteVehicleSkin21,
  AssetConstants.wetWasteVehicleSkin22,
  AssetConstants.dryWasteVehicleSkin21,
  AssetConstants.dryWasteVehicleSkin22,
  AssetConstants.bothWasteVehicleSkin21,
  AssetConstants.bothWasteVehicleSkin22,
  AssetConstants.movingVehicleSkin31,
  AssetConstants.movingVehicleSkin32,
  AssetConstants.wetWasteVehicleSkin31,
  AssetConstants.wetWasteVehicleSkin32,
  AssetConstants.dryWasteVehicleSkin31,
  AssetConstants.dryWasteVehicleSkin32,
  AssetConstants.bothWasteVehicleSkin31,
  AssetConstants.bothWasteVehicleSkin32,
  AssetConstants.movingVehicleSkin41,
  AssetConstants.movingVehicleSkin42,
  AssetConstants.wetWasteVehicleSkin41,
  AssetConstants.wetWasteVehicleSkin42,
  AssetConstants.dryWasteVehicleSkin41,
  AssetConstants.dryWasteVehicleSkin42,
  AssetConstants.bothWasteVehicleSkin41,
  AssetConstants.bothWasteVehicleSkin42,
  AssetConstants.movingVehicleSkin51,
  AssetConstants.movingVehicleSkin52,
  AssetConstants.wetWasteVehicleSkin51,
  AssetConstants.wetWasteVehicleSkin52,
  AssetConstants.dryWasteVehicleSkin51,
  AssetConstants.dryWasteVehicleSkin52,
  AssetConstants.bothWasteVehicleSkin51,
  AssetConstants.bothWasteVehicleSkin52,
  AssetConstants.movingVehicleSkin61,
  AssetConstants.movingVehicleSkin62,
  AssetConstants.wetWasteVehicleSkin61,
  AssetConstants.wetWasteVehicleSkin62,
  AssetConstants.dryWasteVehicleSkin61,
  AssetConstants.dryWasteVehicleSkin62,
  AssetConstants.bothWasteVehicleSkin61,
  AssetConstants.bothWasteVehicleSkin62,
  AssetConstants.magnet2x,
  AssetConstants.magnetProgress100,
  AssetConstants.magnetProgress90,
  AssetConstants.magnetProgress80,
  AssetConstants.magnetProgress70,
  AssetConstants.magnetProgress60,
  AssetConstants.magnetProgress50,
  AssetConstants.magnetProgress40,
  AssetConstants.magnetProgress30,
  AssetConstants.magnetProgress20,
  AssetConstants.magnetProgress10,
  AssetConstants.greenWins,
  AssetConstants.gradientBackground,
];

class AssetConstants {
  AssetConstants._();

  static const String splashScreen = 'splash_screen.png';
  static const String leftGrass = 'grass_left_side.png';
  static const String rightGrass = 'grass_right_side.png';
  static const String road = 'road.png';
  static const String roadStripes = 'road_stripes.png';
  static const String vehicleSkin1 = 'vehicle_1.png';
  static const String idleVehicleSkin1 = 'idle_vehicle.png';

  static const String movingVehicleSkin11 = 'moving_vehicle_skin_1_1.png';
  static const String movingVehicleSkin12 = 'moving_vehicle_skin_1_2.png';
  static const String wetWasteVehicleSkin11 = 'wet_waste_vehicle_skin_1_1.png';
  static const String wetWasteVehicleSkin12 = 'wet_waste_vehicle_skin_1_2.png';
  static const String dryWasteVehicleSkin11 = 'dry_waste_vehicle_skin_1_1.png';
  static const String dryWasteVehicleSkin12 = 'dry_waste_vehicle_skin_1_2.png';
  static const String bothWasteVehicleSkin11 =
      'both_waste_vehicle_skin_1_1.png';
  static const String bothWasteVehicleSkin12 =
      'both_waste_vehicle_skin_1_2.png';

  static const String movingVehicleSkin21 = 'moving_vehicle_skin_2_1.png';
  static const String movingVehicleSkin22 = 'moving_vehicle_skin_2_2.png';
  static const String wetWasteVehicleSkin21 = 'wet_waste_vehicle_skin_2_1.png';
  static const String wetWasteVehicleSkin22 = 'wet_waste_vehicle_skin_2_2.png';
  static const String dryWasteVehicleSkin21 = 'dry_waste_vehicle_skin_2_1.png';
  static const String dryWasteVehicleSkin22 = 'dry_waste_vehicle_skin_2_2.png';
  static const String bothWasteVehicleSkin21 =
      'both_waste_vehicle_skin_2_1.png';
  static const String bothWasteVehicleSkin22 =
      'both_waste_vehicle_skin_2_2.png';

  static const String movingVehicleSkin31 = 'moving_vehicle_skin_3_1.png';
  static const String movingVehicleSkin32 = 'moving_vehicle_skin_3_2.png';
  static const String wetWasteVehicleSkin31 = 'wet_waste_vehicle_skin_3_1.png';
  static const String wetWasteVehicleSkin32 = 'wet_waste_vehicle_skin_3_2.png';
  static const String dryWasteVehicleSkin31 = 'dry_waste_vehicle_skin_3_1.png';
  static const String dryWasteVehicleSkin32 = 'dry_waste_vehicle_skin_3_2.png';
  static const String bothWasteVehicleSkin31 =
      'both_waste_vehicle_skin_3_1.png';
  static const String bothWasteVehicleSkin32 =
      'both_waste_vehicle_skin_3_2.png';

  static const String movingVehicleSkin41 = 'moving_vehicle_skin_4_1.png';
  static const String movingVehicleSkin42 = 'moving_vehicle_skin_4_2.png';
  static const String wetWasteVehicleSkin41 = 'wet_waste_vehicle_skin_4_1.png';
  static const String wetWasteVehicleSkin42 = 'wet_waste_vehicle_skin_4_2.png';
  static const String dryWasteVehicleSkin41 = 'dry_waste_vehicle_skin_4_1.png';
  static const String dryWasteVehicleSkin42 = 'dry_waste_vehicle_skin_4_2.png';
  static const String bothWasteVehicleSkin41 =
      'both_waste_vehicle_skin_4_1.png';
  static const String bothWasteVehicleSkin42 =
      'both_waste_vehicle_skin_4_2.png';

  static const String movingVehicleSkin51 = 'moving_vehicle_skin_5_1.png';
  static const String movingVehicleSkin52 = 'moving_vehicle_skin_5_2.png';
  static const String wetWasteVehicleSkin51 = 'wet_waste_vehicle_skin_5_1.png';
  static const String wetWasteVehicleSkin52 = 'wet_waste_vehicle_skin_5_2.png';
  static const String dryWasteVehicleSkin51 = 'dry_waste_vehicle_skin_5_1.png';
  static const String dryWasteVehicleSkin52 = 'dry_waste_vehicle_skin_5_2.png';
  static const String bothWasteVehicleSkin51 =
      'both_waste_vehicle_skin_5_1.png';
  static const String bothWasteVehicleSkin52 =
      'both_waste_vehicle_skin_5_2.png';

  static const String movingVehicleSkin61 = 'moving_vehicle_skin_6_1.png';
  static const String movingVehicleSkin62 = 'moving_vehicle_skin_6_2.png';
  static const String wetWasteVehicleSkin61 = 'wet_waste_vehicle_skin_6_1.png';
  static const String wetWasteVehicleSkin62 = 'wet_waste_vehicle_skin_6_2.png';
  static const String dryWasteVehicleSkin61 = 'dry_waste_vehicle_skin_6_1.png';
  static const String dryWasteVehicleSkin62 = 'dry_waste_vehicle_skin_6_2.png';
  static const String bothWasteVehicleSkin61 =
      'both_waste_vehicle_skin_6_1.png';
  static const String bothWasteVehicleSkin62 =
      'both_waste_vehicle_skin_6_2.png';

  static const String earthToken = 'earth_token.png';
  static const String magneticField = 'magnetic_field.png';
  static const String magnet = 'magnet.png';
  static const String magnet2x = 'magnet_2x.png';
  static const String alive = 'alive.png';
  static const String lifeOver = 'life_over.png';

  static const String countdownFirst = 'countdown_1.png';
  static const String countdownSecond = 'countdown_2.png';
  static const String countdownThird = 'countdown_3.png';
  static const String countdownFirstXl = 'countdown_1_xl.png';
  static const String countdownSecondXl = 'countdown_2_xl.png';
  static const String countdownThirdXl = 'countdown_3_xl.png';

  static const String tutorialFirst = 'tutorial_1.png';
  static const String tutorialSecond = 'tutorial_2.png';
  static const String tutorialThird = 'tutorial_3.png';
  static const String tutorialFourth = 'tutorial_4.png';
  static const String tutorialFifth = 'tutorial_5.png';
  static const String tutorialSixth = 'tutorial_6.png';
  static const String tutorialSeventh = 'tutorial_7.png';

  static const String tutorialFirstXl = 'tutorial_1_xl.png';
  static const String tutorialSecondXl = 'tutorial_2_xl.png';
  static const String tutorialThirdXl = 'tutorial_3_xl.png';
  static const String tutorialFourthXl = 'tutorial_4_xl.png';
  static const String tutorialFifthXl = 'tutorial_5_xl.png';
  static const String tutorialSixthXl = 'tutorial_6_xl.png';
  static const String tutorialSeventhXl = 'tutorial_7_xl.png';

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
  static const String splashLoadingXl = 'splash_loading_xl.png';

  static const String vehicleSkinOne = 'vehicle_skin_1.png';
  static const String vehicleSkinTwo = 'vehicle_skin_2.png';
  static const String vehicleSkinThree = 'vehicle_skin_3.png';
  static const String vehicleSkinFour = 'vehicle_skin_4.png';
  static const String vehicleSkinFive = 'vehicle_skin_5.png';
  static const String vehicleSkinSix = 'vehicle_skin_6.png';

  static const String glow = 'glow.png';

  static const String upgrade = 'upgrade.png';

  static const String greenWinsGallery = 'gallery.png';

  static const String magnetProgress100 = 'magnet_progress_100.png';
  static const String magnetProgress90 = 'magnet_progress_90.png';
  static const String magnetProgress80 = 'magnet_progress_80.png';
  static const String magnetProgress70 = 'magnet_progress_70.png';
  static const String magnetProgress60 = 'magnet_progress_60.png';
  static const String magnetProgress50 = 'magnet_progress_50.png';
  static const String magnetProgress40 = 'magnet_progress_40.png';
  static const String magnetProgress30 = 'magnet_progress_30.png';
  static const String magnetProgress20 = 'magnet_progress_20.png';
  static const String magnetProgress10 = 'magnet_progress_10.png';

  static const String greenWins = 'green_win.png';
  static const String greenWinsHeading = 'green_wins.png';

  static const String greenWinsCard = 'card.png';
  static const String greenWinsGlow = 'glowing.png';
  static const String greenWinsBolt = 'screw.png';
  static const String greenWinsBattery = 'battery.png';
  static const String greenWinsCan = 'can.png';
  static const String greenWinsBulb = 'bulb.png';
  static const String greenWinsBottle = 'bottle.png';
  static const String greenWinsMobile = 'mobile.png';

  static const String gradientBackground = 'gradient_background.png';

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
    earthToken,
    alive,
    lifeOver,
    countdownFirst,
    countdownSecond,
    countdownThird,
    countdownFirstXl,
    countdownSecondXl,
    countdownThirdXl,
    tutorialFirst,
    tutorialSecond,
    tutorialThird,
    tutorialFourth,
    tutorialFifth,
    tutorialSixth,
    tutorialSeventh,
    tutorialFirstXl,
    tutorialSecondXl,
    tutorialThirdXl,
    tutorialFourthXl,
    tutorialFifthXl,
    tutorialSixthXl,
    tutorialSeventhXl,
    splashLoading,
    splashLoadingXl,
    vehicleSkinOne,
    vehicleSkinTwo,
    vehicleSkinThree,
    vehicleSkinFour,
    vehicleSkinFive,
    vehicleSkinSix,
    glow,
    upgrade,
    magnet2x,
    magnetProgress100,
    magnetProgress90,
    magnetProgress80,
    magnetProgress70,
    magnetProgress60,
    magnetProgress50,
    magnetProgress40,
    magnetProgress30,
    magnetProgress20,
    magnetProgress10,
    gradientBackground,
    greenWins,
    greenWinsHeading,
    greenWinsCard,
    greenWinsGlow,
    greenWinsBolt,
    greenWinsBattery,
    greenWinsCan,
    greenWinsBulb,
    greenWinsBottle,
    greenWinsMobile,
    greenWinsGallery,
  ];
}
