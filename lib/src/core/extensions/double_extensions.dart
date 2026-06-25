import 'dart:math' show pow;

/// Extensions on [double] for common numeric operations.
extension DoubleExtension on double {
  /// Rounds the double to a specified number of decimal [places].
  double roundToDecimal({int places = 8}) {
    final num mod = pow(10.0, places);
    return ((this * mod).round().toDouble() / mod);
  }
}
