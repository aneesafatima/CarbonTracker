import 'package:go_router/go_router.dart';
import 'package:template_flutter/features/onboarding/screens/user_info.dart';
import '../../features/onboarding/screens/onboarding.dart';

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
