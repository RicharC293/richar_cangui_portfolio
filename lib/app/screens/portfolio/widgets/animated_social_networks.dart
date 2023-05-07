import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:richar_cangui/app/screens/portfolio/widgets/social_networks.dart';
import 'package:richar_cangui/domain/notifiers/social_networks_notifier.dart';

class AnimatedSocialNetworks extends ConsumerWidget {
  const AnimatedSocialNetworks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(socialNetworksProvider);
    if (!notifier) return const Offstage();
    return const SocialNetworks();
  }
}
