import 'package:flutter_w10_d29_profile_settings/features/authentication/views/interests_screen_part1.dart';
import 'package:flutter_w10_d29_profile_settings/features/authentication/views/login_screen.dart';
import 'package:flutter_w10_d29_profile_settings/features/authentication/views/sign_up_screen.dart';
import 'package:flutter_w10_d29_profile_settings/features/main_navigation/main_navigation_screen.dart';
import 'package:flutter_w10_d29_profile_settings/features/users/views/privacy_screen.dart';
import 'package:flutter_w10_d29_profile_settings/features/users/views/settings_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: InterestsScreenPart1.routeName,
      path: InterestsScreenPart1.routeURL,
      builder: (context, state) => const InterestsScreenPart1(),
    ),
    GoRoute(
        name: MainNavigationScreen.routeName,
        path: "/:tab(home|search|activity|profile)",
        builder: (context, state) {
          final tab = state.pathParameters["tab"]!;
          return MainNavigationScreen(tab: tab);
        },
        routes: [
          GoRoute(
              name: SettingsScreen.routeName,
              path: SettingsScreen.routeURL,
              builder: (context, state) => const SettingsScreen(),
              routes: [
                GoRoute(
                  name: PrivacyScreen.routeName,
                  path: PrivacyScreen.routeURL,
                  builder: (context, state) => const PrivacyScreen(),
                )
              ]),
        ]),
  ],
);
