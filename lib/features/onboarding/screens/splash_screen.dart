import 'package:carbon_tracker/core/config/route_constants.dart';
import 'package:carbon_tracker/features/onboarding/providers/user_provider.dart';
import 'package:carbon_tracker/features/onboarding/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  Future<void> _checkUser() async {
    try {
      final user = await UserRepository().getUser();
      if (!mounted) return;

      if (user == null) {
        context.goNamed(RouteNames.onboarding);
      } else {
        ref.read(userProvider.notifier).setUser(user);
        context.goNamed(RouteNames.fitnessMetrics);
      }
    } catch (e, st) {
      debugPrint('Error checking user: $e\n$st');
      if (!mounted) return;
      context.goNamed(RouteNames.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
