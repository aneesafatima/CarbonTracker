import 'package:carbon_tracker/database/models/user.dart';
import 'package:carbon_tracker/features/onboarding/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FitnessMetrics extends StatelessWidget {
  const FitnessMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final User user = ref.watch(userProvider)!;
          return Center(
            child: Text('Welcome to Fitness Metrics Screen ${user.name}'),
          );
        },
      ),
    );
  }
}
