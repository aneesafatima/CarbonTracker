import 'package:carbon_tracker/core/config/route_constants.dart';
import 'package:carbon_tracker/features/fitness/screens/main_screen.dart';
import 'package:carbon_tracker/features/onboarding/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:carbon_tracker/features/onboarding/screens/user_info.dart';
import 'package:carbon_tracker/features/onboarding/screens/onboarding.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      name: RouteNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: RoutePaths.onboarding,
      name: RouteNames.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),

    GoRoute(
      path: RoutePaths.userInfo,
      name: RouteNames.userInfo,
      builder: (context, state) => const UserInfoScreen(),
    ),

    GoRoute(
      path: RoutePaths.mainScreen,
      name: RouteNames.mainScreen,
      builder: (context, state) => const MainScreen(),
    ),
  ],
);
