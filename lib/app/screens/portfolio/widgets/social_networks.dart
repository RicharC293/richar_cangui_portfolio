import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/text_content.dart';


class SocialNetworks extends StatelessWidget {
  const SocialNetworks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Button(
          path: 'assets/svg/twitter.svg',
          semanticsLabel: TextContent.instance.twitter,
          url: 'https://twitter.com/richarc293',
        ),
        const SizedBox(width: 20),
        _Button(
          path: 'assets/svg/github.svg',
          semanticsLabel: TextContent.instance.github,
          url: 'https://github.com/RicharC293',
        ),
        const SizedBox(width: 20),
        _Button(
          path: 'assets/svg/linkedin.svg',
          semanticsLabel: TextContent.instance.linkedin,
          url: 'https://www.linkedin.com/in/richar-cangui-laica/',
        ),
      ],
    );
  }
}


class _Button extends StatelessWidget {
  const _Button({Key? key, required this.path, this.semanticsLabel, this.url})
      : super(key: key);
  final String path;
  final String? semanticsLabel;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (url == null) return;
        if (!await launchUrl(
          Uri.parse(url!),
        )) {
          throw Exception('Could not launch $url');
        }
      },
      child: SvgPicture.asset(path,
          width: 30,
          height: 30,
          semanticsLabel: semanticsLabel,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onBackground,
            BlendMode.srcIn,
          )),
    );
  }
}