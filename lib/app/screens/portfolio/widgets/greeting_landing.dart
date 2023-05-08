import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:richar/app/utils/text_content.dart';

class GreetingLanding extends StatelessWidget {
  const GreetingLanding({Key? key, this.onFinished}) : super(key: key);

  final VoidCallback? onFinished;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: false,
      isRepeatingAnimation: false,
      onFinished: onFinished,
      animatedTexts: [
        TypewriterAnimatedText(
          '${TextContent.instance.greeting}\n\n${TextContent.instance.description}',
          textStyle: MediaQuery.of(context).size.width >= 1440
              ? Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 50)
              : Theme.of(context).textTheme.headlineMedium,
          cursor: '|',
          speed: const Duration(milliseconds: 100),
        ),
      ],
    );
  }
}
