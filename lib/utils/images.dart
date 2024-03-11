import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/components/waste.dart';

final Logger _log = Logger(Constants.utilsImagesLoggerKey);

List<String> getDynamicRangeStringList(
    int start, int end, List<String> stringTemplate, int insertAtIndex) {
  _log.info('Generating dynamic range string list');
  List<String> resultList = [];
  for (int i = start; i <= end; i++) {
    if (insertAtIndex >= 0 && insertAtIndex < stringTemplate.length) {
      String formattedString =
          stringTemplate[0] + i.toString() + stringTemplate[1];
      resultList.add(formattedString);
    }
  }
  _log.info('Generated dynamic range string list successfully');
  return [...resultList];
}

List<Sprite> getDynamicRangeSpriteList(
    int start, int end, List<String> stringTemplate, int insertAtIndex) {
  _log.info('Generating dynamic range sprite list');
  List<Sprite> resultList = [];
  for (int i = start; i <= end; i++) {
    if (insertAtIndex >= 0 && insertAtIndex < stringTemplate.length) {
      Sprite sprite = Sprite(Flame.images
          .fromCache(stringTemplate[0] + i.toString() + stringTemplate[1]));
      resultList.add(sprite);
    }
  }
  _log.info('Generated dynamic range sprite list successfully');
  return [...resultList];
}

List<String> getIdleGiftAnimationImages() {
  _log.info('Generating idle gift animation images list');
  List<String> frames = [
    ...getDynamicRangeStringList(0, 9, ['Comp 1_0000', '.png'], 1),
    ...getDynamicRangeStringList(10, 59, ['Comp 1_000', '.png'], 1),
  ];
  _log.info('Generated idle gift animation images list successfully');

  return [...frames];
}

List<Sprite> getIdleGiftAnimationSprites() {
  _log.info('Generating idle gift animation sprites list');
  List<Sprite> sprites = [
    ...getDynamicRangeSpriteList(0, 9, ['Comp 1_0000', '.png'], 1),
    ...getDynamicRangeSpriteList(10, 59, ['Comp 1_000', '.png'], 1),
  ];
  _log.info('Generated idle gift animation sprites list successfully');

  return [...sprites];
}

List<String> getOpeningGiftAnimationImages() {
  _log.info('Generating opening gift animation images list');
  List<String> frames = [
    ...getDynamicRangeStringList(147, 218, ['Comp_1_00', '.png'], 1),
  ];
  _log.info('Generated opening gift animation images list successfully');

  return [...frames];
}

List<Sprite> getOpeningGiftAnimationSprites() {
  _log.info('Generating opening gift animation sprites list');
  List<Sprite> sprites = [
    ...getDynamicRangeSpriteList(147, 218, ['Comp_1_00', '.png'], 1),
  ];
  _log.info('Generated opening gift animation sprites list successfully');

  return [...sprites];
}

List<String> getBuildingVariationImages() {
  _log.info('Generating building variation images list');
  List<String> images = [
    ...getDynamicRangeStringList(
        1, Constants.buildingVariations, ['building_', '.png'], 1),
  ];
  _log.info('Generated building variation images list successfully');

  return [...images];
}

List<Sprite> getIdleVehicleAnimationSprites() {
  _log.info('Generating idle vehicle animation sprites list');
  List<Sprite> sprites = [Sprite(Flame.images.fromCache('idle_vehicle.png'))];
  _log.info('Generated idle vehicle animation sprites list successfully');

  return [...sprites];
}

List<Sprite> getMovingVehicleAnimationSprites() {
  _log.info('Generating moving vehicle animation sprites list');
  List<Sprite> sprites = [
    ...getDynamicRangeSpriteList(1, 2, ['moving_vehicle_', '.png'], 1),
  ];
  _log.info('Generated moving vehicle animation sprites list successfully');

  return [...sprites];
}

List<Sprite> getWetWasteMovingVehicleAnimationSprites() {
  _log.info('Generating wet waste vehicle animation sprites list');
  List<Sprite> sprites = [
    ...getDynamicRangeSpriteList(1, 2, ['wet_waste_vehicle_', '.png'], 1),
  ];
  _log.info('Generated wet waste vehicle animation sprites list successfully');

  return [...sprites];
}

List<Sprite> getDryWasteMovingVehicleAnimationSprites() {
  _log.info('Generating dry waste vehicle animation sprites list');
  List<Sprite> sprites = [
    ...getDynamicRangeSpriteList(1, 2, ['dry_waste_vehicle_', '.png'], 1),
  ];
  _log.info('Generated dry waste vehicle animation sprites list successfully');

  return [...sprites];
}

List<Sprite> getBothWasteMovingVehicleAnimationSprites() {
  _log.info('Generating both waste vehicle animation sprites list');
  List<Sprite> sprites = [
    ...getDynamicRangeSpriteList(1, 2, ['both_waste_vehicle_', '.png'], 1),
  ];
  _log.info('Generated both waste vehicle animation sprites list successfully');

  return [...sprites];
}

List<String> getWasteVariationImages() {
  _log.info('Generating waste variation images list');
  List<String> images = [
    ...getDynamicRangeStringList(11, 13, ['dry_waste_', '.png'], 1),
    ...getDynamicRangeStringList(21, 23, ['dry_waste_', '.png'], 1),
    ...getDynamicRangeStringList(11, 13, ['wet_waste_', '.png'], 1),
    ...getDynamicRangeStringList(21, 23, ['wet_waste_', '.png'], 1),
  ];
  _log.info('Generated waste variation images list successfully');

  return [...images];
}

List<Sprite> getIdleWasteAnimationSpritesByTypeAndCount(
    WasteType type, int count) {
  _log.info('Generating idle waste animation sprites list');

  String template = type == WasteType.wet ? 'wet_waste_' : 'dry_waste_';

  List<Sprite> sprites = [
    ...getDynamicRangeSpriteList(1, 2, [template, '$count.png'], 1),
  ];
  _log.info('Generated idle waste animation sprites list successfully');

  return [...sprites];
}

List<String> getWasteDropAnimationImages() {
  _log.info('Generating waste drop animation images list');
  List<String> frames = [
    ...getDynamicRangeStringList(1, 9, ['trash_drop_', '.png'], 1),
  ];
  _log.info('Generated waste drop animation images list successfully');

  return [...frames];
}

List<Sprite> getWasteDropAnimationSprites() {
  _log.info('Generating waste drop animation sprites list');
  List<Sprite> sprites = [
    ...getDynamicRangeSpriteList(1, 9, ['trash_drop_', '.png'], 1),
  ];
  _log.info('Generated waste drop animation sprites list successfully');

  return [...sprites];
}

String getPathFromAssetString(String asset) {
  return 'assets/images/$asset';
}
