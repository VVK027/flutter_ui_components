/// Interface for classes that can be converted to JSON maps.
abstract class JsonHelper {
  /// Converts the object to a JSON-compatible map.
  Map<String, dynamic>? toJson();
}
