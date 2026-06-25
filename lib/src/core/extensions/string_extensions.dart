import '../utils/log_util.dart';

/// Extensions on [String] for common string manipulations and checks.
extension StringExtension on String {
  /// Returns true if this string equals [text], ignoring case and whitespace.
  bool equalsIgnoreCase(String? text) {
    return toLowerCase().trim() == text?.toLowerCase().trim();
  }

  /// Returns true if this string contains [text], ignoring case.
  bool containsIgnoreCase(String? text) {
    return text == null ? false : toLowerCase().contains(text.toLowerCase());
  }

  /// Capitalizes only the first letter of the string.
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase().trim()}";
  }

  /// Capitalizes the first letter of each word in the string.
  String capitalizeAllFirstLetters() {
    return split(
      ' ',
    ).map((word) => word.capitalizeFirstLetter()).join(' ').trim();
  }

  /// Returns true if the string starts with whitespace.
  bool checkLeadingWhiteSpace() {
    return split(" ").first == '';
  }

  /// Returns true if the string ends with whitespace.
  bool checkTrailingWhiteSpace() {
    return split(" ").last == '';
  }

  /// Parses this string as a [double], returning 0.0 on failure.
  double toDouble() {
    try {
      return double.parse(this);
    } catch (e) {
      LogUtil.logDefaultMsg("StringExtension", "toDouble: parsing failed, $e");
    }
    return 0.0;
  }
}
