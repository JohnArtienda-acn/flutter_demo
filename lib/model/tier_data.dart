import 'dart:ui';

import 'package:flutter/material.dart';

class TierData {
  final String name;
  final int points;
  final Color color;
  final IconData icon;
  final bool isAchieved;

  TierData(
    this.name,
    this.points,
    this.color,
    this.icon,
    this.isAchieved,
  );
}
