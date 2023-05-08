import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:richar/app/screens/portfolio/widgets/skill.dart';
import 'package:richar/app/utils/constants.dart';
import 'package:richar/app/utils/text_content.dart';
import 'package:richar/app/widgets/base_button.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/bold_letters.dart';
import '../widgets/base_page.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> with SingleTickerProviderStateMixin {
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
      setState(() {});
      widget.pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
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
    return ResponsiveBreakpoints.of(context).smallerOrEqualTo('SMALL_DESKTOP')
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
                    TextContent.instance.aboutMe,
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
                      TextContent.instance.aboutMePresentation,
                      style: ResponsiveBreakpoints.of(context)
                              .smallerOrEqualTo(TABLET)
                          ? Theme.of(context).textTheme.titleMedium
                          : Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Flexible(
                    child: Wrap(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: _getMaxWidth(),
                          ),
                          padding: kCanvas6,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TextContent.instance.aboutMeDescriptionTitle,
                                style: _getTitleContentStyle(),
                              ),
                              const SizedBox(height: spacing8),
                              BoldLetters(
                                string: TextContent.instance.aboutMeDescription,
                                overflow: TextOverflow.visible,
                                boldString:
                                    'Mechatronic Engineer Front-end of Websites mobile applications',
                              ),
                              const SizedBox(height: spacing8),
                              BaseButton(
                                  label: 'Contact me',
                                  onTap: () async {
                                    if (!await launchUrl(
                                      Uri.parse(
                                          'https://www.linkedin.com/in/richar-cangui-laica/'),
                                    )) {
                                      throw Exception('Could not launch');
                                    }
                                  }),
                            ],
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: _getMaxWidth()),
                          padding: kCanvas6,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TextContent.instance.aboutMeSkillsTitle,
                                style: _getTitleContentStyle(),
                              ),
                              const SizedBox(height: spacing8),
                              Text(
                                TextContent.instance.aboutMeSkillsLanguages,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                children: const [
                                  Skill(
                                    logo: 'assets/svg/dart.svg',
                                    name: 'Dart',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/javascript.svg',
                                    name: 'Javascript',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/typescript.svg',
                                    name: 'Typescript',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/html-5.svg',
                                    name: 'Html 5',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/css3.svg',
                                    name: 'Css',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/kotlin.svg',
                                    name: 'Kotlin',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/swift.svg',
                                    name: 'Swift',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/python.svg',
                                    name: 'Python',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/arduino.svg',
                                    name: 'Arduino',
                                  ),
                                ],
                              ),
                              const SizedBox(height: spacing4),
                              Text(
                                TextContent.instance.aboutMeSkillsFrameworks,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                children: const [
                                  Skill(
                                    logo: 'assets/svg/flutter.svg',
                                    name: 'Flutter',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/vue.svg',
                                    name: 'Vue',
                                  ),
                                ],
                              ),
                              const SizedBox(height: spacing4),
                              Text(
                                TextContent.instance.aboutMeSkillsOther,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                children: const [
                                  Skill(
                                    logo: 'assets/svg/git.svg',
                                    name: 'Git',
                                  ),
                                  Skill(
                                      logo: 'assets/svg/github.svg',
                                      name: 'Github',
                                      colorFilter: ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      )),
                                  Skill(
                                    logo: 'assets/svg/gitlab.svg',
                                    name: 'Gitlab',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/jira.svg',
                                    name: 'Jira',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/bitbucket.svg',
                                    name: 'Bitbucket',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/wordpress.svg',
                                    name: 'Wordpress',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/figma.svg',
                                    name: 'Figma',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/adobe.svg',
                                    name: 'Adobe XD',
                                  ),
                                  Skill(
                                    logo: 'assets/svg/slack.svg',
                                    name: 'Slack',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
