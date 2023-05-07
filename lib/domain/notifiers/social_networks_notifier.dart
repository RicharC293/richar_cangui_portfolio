import 'package:flutter_riverpod/flutter_riverpod.dart';

final socialNetworksProvider =
    StateNotifierProvider<SocialNetworksNotifier, bool>((ref) {
  return SocialNetworksNotifier();
});

class SocialNetworksNotifier extends StateNotifier<bool> {
  SocialNetworksNotifier() : super(false);

  void showButtons() {
    state = true;
  }
}
