import 'package:carbon_tracker/core/config/app_constants.dart';
import 'package:carbon_tracker/database/models/user.dart';
import 'package:carbon_tracker/features/fitness/data/fitness_data.dart';
import 'package:carbon_tracker/features/fitness/widgets/activity_card.dart';
import 'package:carbon_tracker/features/fitness/widgets/stat_card.dart';
import 'package:carbon_tracker/features/onboarding/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class FitnessMetricsScreen extends StatelessWidget {
  const FitnessMetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final User? user = ref.watch(userProvider);
          return (user == null
              ? Center(
                  child: Text(
                    'Onboarding not completed. Please complete onboarding to view fitness metrics.',
                  ),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(user),
                        const SizedBox(height: 24),
                        _buildStatsGrid(),
                        const SizedBox(height: 34),
                        _buildRecentActivity(),
                      ],
                    ),
                  ),
                ));
        },
      ),
    );
  }
}

Widget _buildHeader(User user) {
  String date = DateFormat("EEEE, MMM d").format(DateTime.now());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(date, style: TextStyle(fontSize: 13, color: AppColors.subtitleText)),
      const SizedBox(height: 4),
      Text(
        'Hello, ${user.name}',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
    ],
  );
}

Widget _buildStatsGrid() {
  return GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: stats
        .map(
          (stat) => StatCard(
            icon: stat.icon,
            iconColor: stat.iconColor,
            iconBg: stat.iconBg,
            label: stat.label,
            value: stat.value,
            unit: stat.unit,
          ),
        )
        .toList(),
  );
}

Widget _buildRecentActivity() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Recent Activity',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 14),
      ListView.builder(
        itemBuilder: (context, index) =>
            ActivityCard(activity: activities[index]),
        itemCount: activities.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    ],
  );
}
