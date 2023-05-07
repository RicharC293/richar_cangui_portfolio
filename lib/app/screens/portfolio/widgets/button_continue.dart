import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:richar_cangui/app/utils/constants.dart';
import 'package:richar_cangui/domain/notifiers/social_networks_notifier.dart';

import '../../../../domain/notifiers/button_notifier.dart';
import '../../../utils/text_content.dart';

class ButtonContinue extends ConsumerStatefulWidget {
  const ButtonContinue({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ButtonContinueState();
}

class _ButtonContinueState extends ConsumerState<ButtonContinue>
    with SingleTickerProviderStateMixin {
  final _animationDuration = const Duration(milliseconds: 200);
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: _animationDuration);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addListener(listener);
  }

  void listener() {
    if (_controller.isCompleted) {
      ref.read(socialNetworksProvider.notifier).showButtons();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (_) {
          ref.read(buttonProvider.notifier).hoverButton();
        },
        onExit: (_) {
          ref.read(buttonProvider.notifier).exitButton();
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: _animationDuration,
            onEnd: () {
              _controller.forward();
            },
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kRadiusCircular),
              color: Colors.transparent,
              border: Border.all(
                color: ref.watch(buttonProvider).color,
                width: 1,
              ),
            ),
            constraints: const BoxConstraints(maxWidth: double.infinity),
            child: Padding(
              padding:
                  ResponsiveBreakpoints.of(context).largerThan('SMALL_DESKTOP')
                      ? kCanvas6H.copyWith(top: spacing4, bottom: spacing4)
                      : kSpaceDevice4H,
              child: ScaleTransition(
                scale: _animation,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      TextContent.instance.button,
                      style: ResponsiveBreakpoints.of(context)
                              .largerThan('SMALL_DESKTOP')
                          ? Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontSize: 40)
                          : Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(width: spacing4),
                    Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                      size: ResponsiveBreakpoints.of(context)
                              .largerThan('SMALL_DESKTOP')
                          ? 25
                          : 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
