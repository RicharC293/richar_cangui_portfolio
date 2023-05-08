import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:richar/app/utils/constants.dart';

class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: ResponsiveBreakpoints.of(context).largerThan('SMALL_DESKTOP')
          ? const EdgeInsets.all(spacing20).copyWith(top: 0, bottom: 0)
          : kCanvas6H,
      child: widget.child,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
