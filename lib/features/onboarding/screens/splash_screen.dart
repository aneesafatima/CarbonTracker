import 'package:carbon_tracker/features/onboarding/providers/user_provider.dart';
import 'package:carbon_tracker/features/onboarding/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:carbon_tracker/core/config/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        router.goNamed('onboarding');
      } else {
        ref.read(userProvider.notifier).setUser(user);
        router.goNamed('fitness-metrics');
      }
    } catch (e, st) {
      debugPrint('Error checking user: $e\n$st');
      if (!mounted) return;
      router.goNamed('onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
