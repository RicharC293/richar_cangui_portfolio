import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:richar_cangui/app/utils/constants.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({Key? key, this.onTap, required this.label})
      : super(key: key);
  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadiusCircular),
          color: Colors.transparent,
          border: Border.all(
            color: primaryColor,
            width: 1,
          ),
        ),
        constraints: const BoxConstraints(maxWidth: double.infinity),
        child: Padding(
          padding: kSpaceDevice4H,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge,
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
    );
  }
}
