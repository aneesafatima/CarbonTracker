import 'package:carbon_tracker/features/fitness/screens/fitness_metrics.dart';
import 'package:carbon_tracker/features/onboarding/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:carbon_tracker/features/onboarding/screens/user_info.dart';
import 'package:carbon_tracker/features/onboarding/screens/onboarding.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => SplashScreen(),
    ),

    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => OnboardingScreen(),
    ),

    GoRoute(
      path: '/user-info',
      name: 'user-info',
      builder: (context, state) => const UserInfoScreen(),
    ),

    GoRoute(
      path: '/fitness-metrics',
      name: 'fitness-metrics',
      builder: (context, state) => const FitnessMetrics(),
    ),
  ],
);
