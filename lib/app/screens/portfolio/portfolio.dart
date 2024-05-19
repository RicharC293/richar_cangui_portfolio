import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:richar/app/screens/portfolio/screens/about_me.dart';
import 'package:richar/app/screens/portfolio/screens/contact_me.dart';
import 'package:richar/app/screens/portfolio/screens/projects_and_experience.dart';
import 'package:richar/app/utils/constants.dart';
import 'package:richar/app/utils/text_content.dart';
import 'package:richar/app/widgets/animated_cursor.dart';
import 'package:url_launcher/url_launcher.dart';

import 'screens/home.dart';

class Portfolio extends ConsumerStatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<Portfolio> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _home = GlobalKey();
  final GlobalKey _aboutMe = GlobalKey();
  final GlobalKey _projectsAndExperience = GlobalKey();
  final GlobalKey _contactMe = GlobalKey();

  void goToWidgetPositioned(GlobalKey key) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox =
          key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null) return;
      _scrollController.jumpTo(0);
      final position = renderBox.localToGlobal(Offset.zero);
      final scrollPosition = position.dy - kToolbarHeight;
      _scrollController.jumpTo(scrollPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCursor(
      child: Scaffold(
        appBar: AppBar(
          actions: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
              ? [
                  TextButton(
                    onPressed: () => goToWidgetPositioned(_home),
                    child: const Text('Home'),
                  ),
                  const SizedBox(width: spacing4),
                  TextButton(
                      onPressed: () => goToWidgetPositioned(_aboutMe),
                      child: Text(TextContent.instance.aboutMe)),
                  const SizedBox(width: spacing4),
                  TextButton(
                      onPressed: () =>
                          goToWidgetPositioned(_projectsAndExperience),
                      child: Text(TextContent.instance.projectsAndExperience)),
                  const SizedBox(width: spacing4),
                  TextButton(
                      onPressed: () => goToWidgetPositioned(_contactMe),
                      child: Text(TextContent.instance.contactMe)),
                  const SizedBox(width: spacing4),
                  TextButton(
                      onPressed: () async {
                        // open external link
                        final url =
                            Uri.parse('https://samples.richarcangui.com/');
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Text(TextContent.instance.mySamples)),
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
                        goToWidgetPositioned(_home);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(TextContent.instance.aboutMe),
                      onTap: () {
                        goToWidgetPositioned(_aboutMe);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(TextContent.instance.projectsAndExperience),
                      onTap: () {
                        goToWidgetPositioned(_projectsAndExperience);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(TextContent.instance.contactMe),
                      onTap: () {
                        goToWidgetPositioned(_contactMe);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          child: Column(
            children: [
              Home(
                key: _home,
                onStart: () => goToWidgetPositioned(_aboutMe),
              ),
              AboutMe(key: _aboutMe),
              ProjectsAndExperience(key: _projectsAndExperience),
              ContactMe(key: _contactMe),
            ],
          ),
        ),
      ),
    );
  }
}
