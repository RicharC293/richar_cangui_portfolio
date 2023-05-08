import 'package:flutter/material.dart';
import 'package:richar/app/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  const Projects(
      {Key? key,
      required this.title,
      required this.description,
      required this.url})
      : super(key: key);

  final String title;
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge),
        Text(description,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Colors.white)),
        InkWell(
          onTap: () async {
            if (!await launchUrl(Uri.parse(url))) {
              throw Exception('Could not launch $url');
            }
          },
          child: Text(url,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: primaryColor)),
        ),
      ],
    );
  }
}
