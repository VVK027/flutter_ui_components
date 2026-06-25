/// Interface for mapping data models to domain entities.
abstract class Mapper<T> {
  /// Converts the current object to its domain entity representation.
  T toEntity();
}
