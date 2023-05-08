import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:richar/app/screens/portfolio/screens/about_me.dart';
import 'package:richar/app/screens/portfolio/screens/contact_me.dart';
import 'package:richar/app/screens/portfolio/screens/projects_and_experience.dart';
import 'package:richar/app/utils/constants.dart';
import 'package:richar/app/utils/text_content.dart';
import 'package:richar/app/widgets/animated_cursor.dart';

import 'screens/home.dart';

class Portfolio extends ConsumerStatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<Portfolio> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return AnimatedCursor(
      child: Scaffold(
        appBar: AppBar(
          actions: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
              ? [
                  TextButton(
                    onPressed: () {
                      _pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: const Text('Home'),
                  ),
                  const SizedBox(width: spacing4),
                  TextButton(
                      onPressed: () {
                        _pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Text(TextContent.instance.aboutMe)),
                  const SizedBox(width: spacing4),
                  TextButton(
                      onPressed: () {
                        _pageController.animateToPage(2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Text(TextContent.instance.projectsAndExperience)),
                  const SizedBox(width: spacing4),
                  TextButton(
                      onPressed: () {
                        _pageController.animateToPage(3,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Text(TextContent.instance.contactMe)),
                ]
              : null,
        ),
        drawer: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
            ? null
            : Drawer(
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Home'),
                      onTap: () {
                        _pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(TextContent.instance.aboutMe),
                      onTap: () {
                        _pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(TextContent.instance.projectsAndExperience),
                      onTap: () {
                        _pageController.animateToPage(2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(TextContent.instance.contactMe),
                      onTap: () {
                        _pageController.animateToPage(3,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
        body: PageView(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          children: [
            Home(pageController: _pageController),
            AboutMe(pageController: _pageController),
            ProjectsAndExperience(pageController: _pageController),
            ContactMe(pageController: _pageController),
          ],
        ),
      ),
    );
  }
}
