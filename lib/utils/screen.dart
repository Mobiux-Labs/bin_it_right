import 'package:reseacue/constants/constants.dart';

enum ScreenSize { small, medium, large, extraLarge }

ScreenSize getScreenSizeType(width) {
  if (width < Constants.minimumMediumScreenWidth) {
    return ScreenSize.small;
  }

  if (width < Constants.minimumLargeScreenWidth) {
    return ScreenSize.medium;
  }

  if (width < Constants.minimumExtraLargeScreenWidth) {
    return ScreenSize.large;
  }

  return ScreenSize.extraLarge;
}
