import 'package:flutter_ui_components/src/core/extensions/string_extensions.dart';

/// Utility class for common string operations and validations.
class StringUtils {
  /// Regular expression for validating email addresses.
  static RegExp emailRegExp = RegExp(
    "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}",
  );

  /// Simple regular expression for basic email validation.
  static RegExp basicEmailRegExp = RegExp(r'^[\w-.]+@([\w-.]+\.)+[\w-]{2,4}$');

  /// Regular expression for validating names (alphanumeric and spaces).
  static RegExp nameRegExp = RegExp(r'[a-zA-Z0-9 ]');

  /// Regular expression for identifying special characters.
  static RegExp specialCharRegExp = RegExp(r'[!@#$%^&*(),.?":;~`{}|<>]');

  /// Regular expression for validating phone numbers (numeric only).
  static RegExp phoneRegExp = RegExp(r'[0-9]');

  /// Regular expression for identifying whitespace and newlines.
  static RegExp removeWhiteSpacesRegExp = RegExp(r'[\s\n]+');

  /// Regular expression for characters not allowed in banners or filenames.
  static RegExp bannerCharRegExp = RegExp(r'[<>:"/\\|?*]');

  /// Regular expression for trailing dots.
  static RegExp dotRegExp = RegExp(r'[.]+$');

  /// Returns true if [text] contains any special characters.
  static bool containsSpecialCharacters(String text) {
    return text.contains(specialCharRegExp);
  }

  /// Validates [email] against [emailRegExp].
  static bool validEmail(String email) {
    return email.contains(emailRegExp);
  }

  /// Validates [email] against [basicEmailRegExp].
  static bool isValidBasicEmail(String email) {
    return basicEmailRegExp.hasMatch(email);
  }

  /// Checks if [password] meets minimum length requirements.
  static bool isValidPassword(String password) {
    return password.length >= 8;
  }

  /// Validates [phone] number length.
  static bool validPhoneNumber(String phone) {
    return (phone.isNotEmpty && phone.length >= 7 && phone.length <= 13);
  }

  /// Validates [text] as a name, ensuring no special characters or improper whitespace.
  static bool isValidName(String text) {
    if (containsSpecialCharacters(text) && text.isNotEmpty) {
      return false;
    } else if (text.checkLeadingWhiteSpace() && text.isNotEmpty) {
      return false;
    } else if (text.checkTrailingWhiteSpace() && text.isNotEmpty) {
      return false;
    }
    return true;
  }

  /// Extracts the first name from a full [name] string.
  static String getFirstName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "";
    } else {
      try {
        final parts = name.split(" ");
        return parts.length > 1
            ? parts.getRange(0, parts.length - 1).join(" ")
            : name;
      } catch (_) {
        return "";
      }
    }
  }

  /// Extracts the last name from a full [name] string.
  static String getLastName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "";
    } else {
      try {
        final parts = name.split(" ");
        return parts.length > 1 ? parts.last : "";
      } catch (_) {
        return "";
      }
    }
  }

  /// Returns initials from a [name] string (up to two characters).
  static String getShortNamedString(String? name) {
    List<String> list = name?.split(" ") ?? [""];
    if (list.length > 1) {
      var k = "";
      if (list.first.isNotEmpty) {
        k = list.first.split("").first.toUpperCase();
      }
      if (list[1].isNotEmpty) {
        k += list[1].split("").first.toUpperCase();
      }
      return k;
    } else if (list.first.split("").isNotEmpty) {
      return list.first.split("").first.toUpperCase();
    }
    return "";
  }

  /// Collapses multiple whitespaces and newlines into a single space.
  static String collapseWhiteSpaces(String text) {
    return text.replaceAll(removeWhiteSpacesRegExp, ' ').trim();
  }

  /// Appends a dot to [text] if it doesn't already have one.
  static String ensureEndsWithDot(String text) {
    return text.endsWith('.') ? text : '$text.';
  }

  /// Removes trailing dots from [text].
  static String doesNotEndWithDot(String text) {
    return text.replaceAll(dotRegExp, '');
  }

  /// Sanitizes [text] by replacing invalid characters with underscores.
  static String sanitizedText(String text) {
    return text
        .replaceAll(bannerCharRegExp, '_')
        .trimRight()
        .replaceAll(dotRegExp, '');
  }
}
