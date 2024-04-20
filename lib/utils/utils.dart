export 'number.dart';
export 'images.dart';

String truncateText(String text, int maxLength, {String suffix = '...'}) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return text.substring(0, maxLength - suffix.length) + suffix;
  }
}
