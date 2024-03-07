import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:logging/logging.dart';
import 'package:reseacue/constants/constants.dart';

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
    insertAtIndex++;
  }
  _log.info('Generated dynamic range string list successfully');
  return resultList;
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
    insertAtIndex++;
  }
  _log.info('Generated dynamic range sprite list successfully');
  return resultList;
}

List<String> getIdleGiftAnimationImages() {
  _log.info('Generating idle gift animation images list');
  List<String> frames = [
    ...getDynamicRangeStringList(0, 9, ['Comp 1_0000', '.png'], 1),
    ...getDynamicRangeStringList(10, 59, ['Comp 1_000', '.png'], 1),
  ];
  _log.info('Generated idle gift animation images list successfully');

  return frames;
}

List<Sprite> getIdleGiftAnimationSprites() {
  _log.info('Generating idle gift animation sprites list');
  List<Sprite> sprites = [
    ...getDynamicRangeSpriteList(0, 9, ['Comp 1_0000', '.png'], 1),
    ...getDynamicRangeSpriteList(10, 59, ['Comp 1_000', '.png'], 1),
  ];
  _log.info('Generated idle gift animation sprites list successfully');

  return sprites;
}

List<String> getOpeningGiftAnimationImages() {
  _log.info('Generating opening gift animation images list');
  List<String> frames = [
    ...getDynamicRangeStringList(147, 218, ['Comp 1_00', '.png'], 1),
  ];
  _log.info('Generated opening gift animation images list successfully');

  return frames;
}

List<Sprite> getOpeningGiftAnimationSprites() {
  _log.info('Generating opening gift animation sprites list');
  List<Sprite> sprites = [
    ...getDynamicRangeSpriteList(147, 218, ['Comp 1_00', '.png'], 1),
  ];
  _log.info('Generated openinig gift animation sprites list successfully');

  return sprites;
}

List<String> getBuildingVariationImages() {
  _log.info('Generating building variation images list');
  List<String> images = [
    ...getDynamicRangeStringList(
        1, Constants.buildingVariations, ['building_', '.png'], 1),
  ];
  _log.info('Generated building variation images list successfully');

  return images;
}
