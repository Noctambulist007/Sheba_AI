import 'package:flutter/material.dart';

class NavigationItem {
  NavigationItem({
    this.icon,
    this.iconData,
    required this.label,
  }) : assert(icon != null || iconData != null);

  final String? icon;
  final IconData? iconData;
  final String label;
}
