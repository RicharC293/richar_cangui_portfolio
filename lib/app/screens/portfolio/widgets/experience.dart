import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class Experience extends StatelessWidget {
  const Experience(
      {Key? key,
      required this.url,
      required this.title,
      required this.company,
      required this.date})
      : super(key: key);

  final String url;
  final String title;
  final String company;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          url,
          width: 50,
        ),
        const SizedBox(width: spacing5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.labelLarge),
              Text(company,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Colors.white)),
              Text(date,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}
