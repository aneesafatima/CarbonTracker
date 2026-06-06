import 'package:go_router/go_router.dart';
import 'package:carbon_tracker/features/onboarding/screens/user_info.dart';
import 'package:carbon_tracker/features/onboarding/screens/onboarding.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'onboarding',
      builder: (context, state) => OnboardingScreen(),
    ),

    GoRoute(
      path: '/user-info',
      name: 'user-info',
      builder: (context, state) => const UserInfoScreen(),
    ),
  ],
);
