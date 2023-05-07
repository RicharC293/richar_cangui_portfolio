import 'package:flutter/material.dart';

class ButtonModel {
  final double width;
  final double height;
  final Color color;

  ButtonModel({required this.width, required this.height, required this.color});

  ButtonModel copyWith({double? width, double? height, Color? color}) {
    return ButtonModel(
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
    );
  }
}
