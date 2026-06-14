import 'package:carbon_tracker/features/fitness/data/fitness_data.dart';
import 'package:flutter/material.dart';
import 'package:carbon_tracker/core/config/app_constants.dart';

class ActivityCard extends StatefulWidget {
  final Activity activity;

  const ActivityCard({super.key, required this.activity});

  @override
  State<ActivityCard> createState() => ActivityCardState();
}

class ActivityCardState extends State<ActivityCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 500),
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          color: AppColors.metricsBackgroundColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: widget.activity.bgColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    widget.activity.icon,
                    color: widget.activity.iconColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.activity.name,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        widget.activity.time,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.minisculeText,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      _isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                      color: Color(0xFF888780),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),

            if (_isExpanded)
              Column(
                children: [
                  const SizedBox(height: 14),
                  const Divider(color: Color(0xFFD3D1C7), height: 1),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ActivityStat(
                        label: 'Calories',
                        value: widget.activity.calories,
                        unit: 'kcal',
                      ),
                      _ActivityStat(
                        label: 'Distance',
                        value: widget.activity.distance,
                        unit: 'km',
                      ),
                      _ActivityStat(
                        label: 'Avg. Pace',
                        value: widget.activity.pace,
                        unit: '/km',
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _ActivityStat extends StatelessWidget {
  final String label;
  final String value;
  final String unit;

  const _ActivityStat({
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: AppColors.subtitleText),
        ),
        const SizedBox(height: 3),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2C2C2A),
              ),
            ),
            const SizedBox(width: 2),
            Text(
              unit,
              style: const TextStyle(fontSize: 11, color: Color(0xFF888780)),
            ),
          ],
        ),
      ],
    );
  }
}
