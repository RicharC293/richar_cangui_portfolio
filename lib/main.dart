import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:richar/app/screens/portfolio/portfolio.dart';
import 'package:richar/app/screens/privacity/privacity.dart';

import 'app/utils/custom_scroll_behaivor.dart';
import 'app/utils/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Richar Cangui',
        theme: theme,
        routerConfig: GoRouter(
          initialLocation: Portfolio.routeName,
          routes: [
            GoRoute(
              path: Portfolio.routeName,
              builder: (context, state) => const Portfolio(),
            ),
            GoRoute(
              path: PrivacyPolicy.routeName,
              builder: (context, state) => const PrivacyPolicy(),
            ),
          ],
        ),
        scrollBehavior: CustomScrollBehavior(),
        builder: (context, child) {
          return ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1440, name: 'SMALL_DESKTOP'),
              const Breakpoint(start: 1481, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          );
        });
  }
}
