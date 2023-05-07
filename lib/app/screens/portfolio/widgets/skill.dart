import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:richar_cangui/app/utils/constants.dart';

class Skill extends StatefulWidget {
  const Skill({Key? key, required this.logo, this.name, this.colorFilter})
      : super(key: key);
  final String logo;
  final String? name;
  final ColorFilter? colorFilter;

  @override
  State<Skill> createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kSpaceDevice2,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.basic,
        child: Tooltip(
          message: widget.name,
          enableFeedback: true,
          triggerMode: TooltipTriggerMode.tap,
          child: SvgPicture.asset(
            widget.logo,
            width: 30,
            height: 30,
            colorFilter: _isHovered
                ? ColorFilter.mode(
                    Colors.white.withOpacity(0.5), BlendMode.srcATop)
                : widget.colorFilter,
          ),
        ),
      ),
    );
  }
}
