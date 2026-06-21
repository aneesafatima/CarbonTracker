import 'package:flutter/material.dart';

class StatCardData {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String label;
  final String value;
  final String unit;

  StatCardData({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.label,
    required this.value,
    this.unit = '',
  });
}

final List<StatCardData> stats = [
  StatCardData(
    icon: Icons.local_fire_department_rounded,
    iconColor: const Color(0xFFE8622A),
    iconBg: const Color(0xFFFFF0E8),
    label: 'Calories Burned',
    value: '1.4K',
    unit: 'kcal',
  ),
  StatCardData(
    icon: Icons.location_on,
    iconColor: const Color(0xFF4A90D9),
    iconBg: const Color(0xFFE8F2FB),
    label: 'Distance Covered',
    value: '3.2',
    unit: 'km',
  ),
  StatCardData(
    icon: Icons.favorite_rounded,
    iconColor: const Color(0xFFD94F70),
    iconBg: const Color(0xFFFCEBF1),
    label: 'Heart Rate',
    value: '78',
    unit: 'bpm',
  ),
  StatCardData(
    icon: Icons.directions_walk_rounded,
    iconColor: const Color(0xFF3E7A2F),
    iconBg: const Color(0xFFEAF3DE),
    label: 'Steps',
    value: '5,230',
  ),
];

class ActivityType {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  const ActivityType({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });
}

class ActivityIcons {
  ActivityIcons._();

  static const run = ActivityType(
    icon: Icons.directions_run_rounded,
    iconColor: Color(0xFF7C3AED),
    bgColor: Color(0xFFF3E8FF),
  );

  static const walk = ActivityType(
    icon: Icons.directions_walk_rounded,
    iconColor: Color(0xFF059669),
    bgColor: Color(0xFFECFDF5),
  );

  static const bike = ActivityType(
    icon: Icons.directions_bike_rounded,
    iconColor: Color(0xFFDC2626),
    bgColor: Color(0xFFFEF2F2),
  );

  static const jog = ActivityType(
    icon: Icons.directions_run_rounded,
    iconColor: Color(0xFFD97706),
    bgColor: Color(0xFFFFF7ED),
  );
}

class Activity {
  final String name;
  final String time;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String calories;
  final String distance;
  final String pace;

  Activity({
    required this.name,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.calories,
    required this.distance,
    required this.pace,
  });
}

final List<Activity> activities = [
  Activity(
    name: 'Morning Run',
    time: 'Today, 7:00 AM',
    icon: ActivityIcons.run.icon,
    iconColor: ActivityIcons.run.iconColor,
    bgColor: ActivityIcons.run.bgColor,
    calories: '300',
    distance: '5.0',
    pace: "6'00\"",
  ),
  Activity(
    name: 'Evening Walk',
    time: 'Yesterday, 6:30 PM',
    icon: ActivityIcons.walk.icon,
    iconColor: ActivityIcons.walk.iconColor,
    bgColor: ActivityIcons.walk.bgColor,
    calories: '150',
    distance: '3.2',
    pace: "8'00\"",
  ),
  Activity(
    name: 'Cycling',
    time: 'Yesterday, 5:00 PM',
    icon: ActivityIcons.bike.icon,
    iconColor: ActivityIcons.bike.iconColor,
    bgColor: ActivityIcons.bike.bgColor,
    calories: '400',
    distance: '10.0',
    pace: "3'00\"",
  ),
];
