import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:richar_cangui/app/screens/portfolio/widgets/experience.dart';
import 'package:richar_cangui/app/screens/portfolio/widgets/projects.dart';
import 'package:richar_cangui/app/screens/portfolio/widgets/skill.dart';
import 'package:richar_cangui/app/utils/constants.dart';
import 'package:richar_cangui/app/utils/text_content.dart';
import 'package:richar_cangui/app/widgets/base_button.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/bold_letters.dart';
import '../widgets/base_page.dart';

class ProjectsAndExperience extends StatefulWidget {
  const ProjectsAndExperience({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;

  @override
  State<ProjectsAndExperience> createState() => _ProjectsAndExperienceState();
}

class _ProjectsAndExperienceState extends State<ProjectsAndExperience>
    with SingleTickerProviderStateMixin {
  late RiveAnimationController _controllerWalk;
  late ScrollController _scrollController;
  double _leftPositioned = -50;
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _controllerWalk = SimpleAnimation('walking', autoplay: true);
    _scrollController = ScrollController()..addListener(scrollListener);
    Future.delayed(const Duration(seconds: 3), () {
      if (_leftPositioned != -50) return;
      _leftPositioned = MediaQuery.of(context).size.width + 100;
      _isFirstTime = true;
      setState(() {});
    });
  }

  void scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _leftPositioned = MediaQuery.of(context).size.width + 100;
      _isFirstTime = true;
      widget.pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      setState(() {});
    }
    if (_scrollController.hasClients &&
        _scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      widget.pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controllerWalk.dispose();
    _scrollController.dispose();
  }

  TextStyle? _getTitleContentStyle() {
    return ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
        ? Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold)
        : Theme.of(context)
            .textTheme
            .displaySmall
            ?.copyWith(fontWeight: FontWeight.bold);
  }

  double _getMaxWidth() {
    return ResponsiveBreakpoints.of(context).smallerOrEqualTo('SMALL_DESKTOP')
        ? 350
        : MediaQuery.of(context).size.width * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return KeepAlivePage(
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 3),
            bottom: 0,
            left: _leftPositioned,
            onEnd: () {
              _leftPositioned = -50;
              _isFirstTime = false;
              setState(() {});
            },
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(_isFirstTime ? 0 : pi),
              child: SizedBox(
                width: 50,
                height: 50,
                child: RiveAnimation.asset(
                  'assets/rive/among_us.riv',
                  controllers: [_controllerWalk],
                  onInit: (_) => setState(() {}),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: spacing10),
                  Text(
                    TextContent.instance.projectsAndExperience,
                    style: ResponsiveBreakpoints.of(context)
                            .smallerOrEqualTo(TABLET)
                        ? Theme.of(context).textTheme.displayMedium
                        : Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: spacing5),
                  Container(
                    constraints:
                        const BoxConstraints(maxWidth: 100, maxHeight: 5),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: spacing5),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8),
                    child: Text(
                      TextContent.instance.projectsAndExperiencePresentation,
                      style: ResponsiveBreakpoints.of(context)
                              .smallerOrEqualTo(TABLET)
                          ? Theme.of(context).textTheme.titleMedium
                          : Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: spacing8),
                  Flexible(
                      child: Wrap(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: _getMaxWidth(),
                        ),
                        padding: kCanvas6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              TextContent.instance.experienceTitle,
                              style: _getTitleContentStyle(),
                            ),
                            const SizedBox(height: spacing6),
                            Experience(
                              url: TextContent.instance.shappiUrl,
                              title: TextContent.instance.shappiTitle,
                              company: TextContent.instance.shappiDescription,
                              date: TextContent.instance.shappiDate,
                            ),
                            const SizedBox(height: spacing2),
                            Experience(
                              url: TextContent.instance.tiptiUrl,
                              title: TextContent.instance.tiptiTitle0,
                              company: TextContent.instance.tiptiDescription,
                              date: TextContent.instance.tiptiDate0,
                            ),
                            const SizedBox(height: spacing2),
                            Experience(
                              url: TextContent.instance.tiptiUrl,
                              title: TextContent.instance.tiptiTitle1,
                              company: TextContent.instance.tiptiDescription,
                              date: TextContent.instance.tiptiDate1,
                            ),
                            const SizedBox(height: spacing2),
                            Experience(
                              url: TextContent.instance.tiptiUrl,
                              title: TextContent.instance.tiptiTitle2,
                              company: TextContent.instance.tiptiDescription,
                              date: TextContent.instance.tiptiDate2,
                            ),
                            const SizedBox(height: spacing2),
                            Experience(
                              url: TextContent.instance.sofcasUrl,
                              title: TextContent.instance.sofcasTitle,
                              company: TextContent.instance.sofcasDescription,
                              date: TextContent.instance.sofcasDate,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: _getMaxWidth(),
                        ),
                        padding: kCanvas6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              TextContent.instance.projectsTitle,
                              style: _getTitleContentStyle(),
                            ),
                            const SizedBox(height: spacing6),
                            Projects(
                              title: TextContent.instance.nameProject1,
                              description:
                                  TextContent.instance.descriptionProject1,
                              url: TextContent.instance.urlProject1,
                            ),
                            const SizedBox(height: spacing2),
                            Projects(
                              title: TextContent.instance.nameProject2,
                              description:
                              TextContent.instance.descriptionProject2,
                              url: TextContent.instance.urlProject2,
                            ),
                            const SizedBox(height: spacing2),
                            Projects(
                              title: TextContent.instance.nameProject3,
                              description:
                              TextContent.instance.descriptionProject3,
                              url: TextContent.instance.urlProject3,
                            ),
                            const SizedBox(height: spacing2),
                          ],
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
