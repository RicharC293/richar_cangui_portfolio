import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:rive/rive.dart';

import '../../../../domain/notifiers/button_notifier.dart';
import '../../../utils/constants.dart';
import '../widgets/base_page.dart';
import '../widgets/button_continue.dart';
import '../widgets/greeting_landing.dart';
import '../widgets/animated_social_networks.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key, required this.onStart}) : super(key: key);
  final VoidCallback onStart;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late RiveAnimationController _controllerFly;
  late RiveAnimationController _controllerIdle;

  /// Is the animation currently playing?
  bool _isPlayingFly = false;
  bool _isPlayingIdle = false;

  @override
  void initState() {
    super.initState();
    _controllerFly = OneShotAnimation(
      'Fly',
      autoplay: true,
      onStop: () => setState(() => _isPlayingFly = false),
      onStart: () => setState(() => _isPlayingFly = true),
    );
    _controllerIdle = OneShotAnimation(
      'Thumbnail',
      autoplay: true,
      onStop: () => setState(() => _isPlayingIdle = false),
      onStart: () => setState(() => _isPlayingIdle = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeepAlivePage(
      child: Wrap(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth:
                  ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
                      ? ResponsiveBreakpoints.of(context).screenWidth
                      : ResponsiveBreakpoints.of(context).screenWidth * .6,
              maxWidth:
                  ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
                      ? ResponsiveBreakpoints.of(context).screenWidth
                      : ResponsiveBreakpoints.of(context).screenWidth * .6,
              maxHeight:
                  ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
                      ? ResponsiveBreakpoints.of(context).screenHeight * .45
                      : ResponsiveBreakpoints.of(context).screenHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: spacing8),
                GreetingLanding(
                  onFinished: () {
                    ref.read(buttonProvider.notifier).showButton();
                  },
                ),
                const SizedBox(height: spacing8),
                ButtonContinue(
                  onTap: () {
                    setState(() {
                      _isPlayingFly ? null : _controllerFly.isActive = true;
                    });
                    widget.onStart.call();
                  },
                ),
                if (ResponsiveBreakpoints.of(context)
                    .largerOrEqualTo('SMALL_DESKTOP')) ...[
                  const SizedBox(height: spacing8),
                  const AnimatedSocialNetworks(),
                  const SizedBox(height: spacing8),
                ]
              ],
            ),
          ),
          SizedBox(
            width: ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
                ? ResponsiveBreakpoints.of(context).screenWidth
                : ResponsiveBreakpoints.of(context).screenWidth * .25,
            height: ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
                ? ResponsiveBreakpoints.of(context).screenHeight * .5
                : ResponsiveBreakpoints.of(context).screenHeight,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) {
                setState(() {
                  _isPlayingFly ? null : _controllerFly.isActive = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isPlayingIdle ? null : _controllerIdle.isActive = true;
                });
              },
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPlayingFly ? null : _controllerFly.isActive = true;
                  });
                },
                child: RiveAnimation.asset(
                  'assets/rive/robot_up.riv',
                  artboard: 'Character',
                  animations: const ['Thumbnail', 'Fly'],
                  controllers: [
                    _controllerIdle,
                    _controllerFly,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
