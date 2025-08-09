class JsonParser {
  /// Safely converts a dynamic value to an int.
  /// Returns null if the value is null or can't be converted.
  static int? toIntOrNull(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) {
      try {
        return int.parse(value);
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  /// Safely converts a dynamic value to an int with default value.
  /// Returns the default value if the value is null or can't be converted.
  static int toIntOrDefault(dynamic value, {int defaultValue = 0}) {
    return toIntOrNull(value) ?? defaultValue;
  }

  /// Safely converts a dynamic value to a double.
  /// Returns null if the value is null or can't be converted.
  static double? toDoubleOrNull(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is num) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  /// Safely converts a dynamic value to a double with default value.
  /// Returns the default value if the value is null or can't be converted.
  static double toDoubleOrDefault(dynamic value, {double defaultValue = 0.0}) {
    return toDoubleOrNull(value) ?? defaultValue;
  }

  /// Safely converts a dynamic value to a string.
  /// Returns null if the value is null.
  static String? toStringOrNull(dynamic value) {
    if (value == null) return null;
    return value.toString();
  }

  /// Safely converts a dynamic value to a string with default value.
  /// Returns the default value if the value is null.
  static String toStringOrDefault(dynamic value, {String defaultValue = ''}) {
    return toStringOrNull(value) ?? defaultValue;
  }

  /// Safely converts a dynamic value to a boolean.
  /// Returns null if the value is null or can't be converted.
  static bool? toBoolOrNull(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is String) {
      return value.toLowerCase() == 'true';
    }
    if (value is num) {
      return value != 0;
    }
    return null;
  }

  /// Safely converts a dynamic value to a boolean with default value.
  /// Returns the default value if the value is null or can't be converted.
  static bool toBoolOrDefault(dynamic value, {bool defaultValue = false}) {
    return toBoolOrNull(value) ?? defaultValue;
  }
}
