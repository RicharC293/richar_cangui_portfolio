import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:richar_cangui/app/utils/constants.dart';
import 'package:richar_cangui/domain/models/button_model.dart';

final buttonProvider =
    StateNotifierProvider<ButtonNotifier, ButtonModel>((ref) {
  return ButtonNotifier();
});

class ButtonNotifier extends StateNotifier<ButtonModel> {
  ButtonNotifier()
      : super(ButtonModel(width: 150, height: 50, color: Colors.transparent));

  void showButton() {
    state = ButtonModel(width: 150, height: 50, color: primaryButtonColor);
  }

  void hoverButton() {
    state = ButtonModel(width: 150, height: 50, color: primaryButtonHoverColor);
  }

  void exitButton() {
    state = ButtonModel(width: 150, height: 50, color: primaryButtonColor);
  }
}
