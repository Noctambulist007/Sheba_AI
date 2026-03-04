import 'package:flutter/material.dart';

class MedicineTimeParser {
  static List<TimeOfDay> parse(String frequency, String? instructions) {
    final times = <TimeOfDay>[];
    
    // Check if instructions contain specific times (simple regex for "7 AM", "11 PM")
    if (instructions != null && instructions.isNotEmpty) {
       final explicitTimes = _parseExplicitTimes(instructions);
       if (explicitTimes.isNotEmpty) {
         return explicitTimes;
       }
    }

    // Default parsing based on frequency pattern like "1-0-1"
    final parts = frequency.split(RegExp(r'[-/,\s]+'));
    
    if (parts.isNotEmpty) {
      if (parts.length >= 1 && _isPositive(parts[0])) {
        times.add(const TimeOfDay(hour: 8, minute: 0)); // Morning
      }
      if (parts.length >= 2 && _isPositive(parts[1])) {
        times.add(const TimeOfDay(hour: 13, minute: 0)); // Noon
      }
      if (parts.length >= 3 && _isPositive(parts[2])) {
         // If 3 parts: Morning, Noon, Night. If 4 parts: Morning, Noon, Afternoon, Night
         if (parts.length == 3) {
            times.add(const TimeOfDay(hour: 21, minute: 0)); // Night
         } else {
            times.add(const TimeOfDay(hour: 17, minute: 0)); // Afternoon
         }
      }
      if (parts.length >= 4 && _isPositive(parts[3])) {
        times.add(const TimeOfDay(hour: 21, minute: 0)); // Night
      }
    }

    return times;
  }

  static bool _isPositive(String part) {
    try {
      // Handle fractions like "1/2" or whole numbers
      if (part.contains('/')) {
        return true; 
      }
      final value = double.parse(part);
      return value > 0;
    } catch (e) {
      return false;
    }
  }

  static List<TimeOfDay> _parseExplicitTimes(String instructions) {
    // Regex for patterns like "7 AM", "11:30 PM", "7am"
    final regex = RegExp(r'(\d{1,2})(?::(\d{2}))?\s*(AM|PM|am|pm)', caseSensitive: false);
    final matches = regex.allMatches(instructions);
    final times = <TimeOfDay>[];

    for (final match in matches) {
      int hour = int.parse(match.group(1)!);
      final minute = match.group(2) != null ? int.parse(match.group(2)!) : 0;
      final period = match.group(3)!.toUpperCase();

      if (period == 'PM' && hour != 12) {
        hour += 12;
      } else if (period == 'AM' && hour == 12) {
        hour = 0;
      }

      if (hour >= 0 && hour < 24 && minute >= 0 && minute < 60) {
        times.add(TimeOfDay(hour: hour, minute: minute));
      }
    }
    return times;
  }
}
