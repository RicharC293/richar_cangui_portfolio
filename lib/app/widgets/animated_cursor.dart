import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/constants.dart';

class AnimatedCursorState {
  const AnimatedCursorState({
    this.offset = Offset.zero,
    this.size = kDefaultSize,
    this.pointSize = kDefaultPointSize,
    this.decoration = kDefaultDecoration,
    this.decorationPoint = kDefaultDecorationPoint,
  });

  static const Size kDefaultSize = Size(20, 20);
  static const Size kDefaultPointSize = Size(5, 5);

  static const BoxDecoration kDefaultDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(90)),
    color: Colors.white70,
  );

  static const BoxDecoration kDefaultDecorationPoint = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(90)),
    color: primaryColor,
  );

  final BoxDecoration decoration;
  final Offset offset;
  final Size size;
  final Size pointSize;
  final BoxDecoration decorationPoint;
}

final animatedCursorProvider =
    ChangeNotifierProvider<AnimatedCursorProvider>((ref) {
  return AnimatedCursorProvider();
});

class AnimatedCursorProvider extends ChangeNotifier {
  AnimatedCursorProvider();

  AnimatedCursorState _state = const AnimatedCursorState();

  AnimatedCursorState get state => _state;

  void changeCursor(GlobalKey key, {BoxDecoration? decoration}) {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    _state = AnimatedCursorState(
      size: renderBox.size,
      offset: renderBox
          .localToGlobal(Offset.zero)
          .translate(renderBox.size.width / 2, renderBox.size.height / 2),
      decoration: decoration ?? AnimatedCursorState.kDefaultDecoration,
    );
    notifyListeners();
  }

  void resetCursor() {
    _state = const AnimatedCursorState();
    notifyListeners();
  }

  void updateCursorPosition(Offset pos) {
    _state = AnimatedCursorState(offset: pos);
    notifyListeners();
  }
}

class AnimatedCursor extends ConsumerWidget {
  const AnimatedCursor({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context, ref) {
    final state =
        ref.watch<AnimatedCursorProvider>(animatedCursorProvider).state;
    return Stack(
      children: [
        if (child != null) child!,
        Positioned.fill(
          child: MouseRegion(
            opaque: false,
            onHover: (e) => ref
                .read<AnimatedCursorProvider>(animatedCursorProvider)
                .updateCursorPosition(e.position),
          ),
        ),

        Visibility(
          visible: state.offset != Offset.zero,
          child: AnimatedPositioned(
            left: state.offset.dx - state.pointSize.width / 2,
            top: state.offset.dy - state.pointSize.height / 2,
            width: state.pointSize.width,
            height: state.pointSize.height,
            duration: const Duration(milliseconds: 100),
            child: IgnorePointer(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutExpo,
                width: state.pointSize.width,
                height: state.pointSize.height,
                decoration: state.decorationPoint,
              ),
            ),
          ),
        ),
        Visibility(
          visible: state.offset != Offset.zero,
          child: AnimatedPositioned(
            left: state.offset.dx - state.size.width / 2,
            top: state.offset.dy - state.size.height / 2,
            width: state.size.width,
            height: state.size.height,
            duration: const Duration(milliseconds: 300),
            child: IgnorePointer(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutExpo,
                width: state.size.width,
                height: state.size.height,
                decoration: state.decoration,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCursorMouseRegion extends ConsumerStatefulWidget {
  const AnimatedCursorMouseRegion({Key? key, this.child, this.decoration})
      : super(key: key);

  final Widget? child;
  final BoxDecoration? decoration;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnimatedCursorMouseRegionState();
}

class _AnimatedCursorMouseRegionState
    extends ConsumerState<AnimatedCursorMouseRegion> {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final cubit = ref.watch<AnimatedCursorProvider>(animatedCursorProvider);
    return MouseRegion(
      key: _key,
      opaque: false,
      onHover: (_) => cubit.changeCursor(_key, decoration: widget.decoration),
      onExit: (_) => cubit.resetCursor(),
      child: widget.child,
    );
  }
}
