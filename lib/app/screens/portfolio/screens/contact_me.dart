import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:richar/app/screens/portfolio/widgets/social_networks.dart';
import 'package:richar/app/utils/constants.dart';
import 'package:richar/app/utils/text_content.dart';
import 'package:richar/app/widgets/base_button.dart';
import 'package:richar/services/mail_service.dart';
import 'package:rive/rive.dart';

import '../widgets/base_page.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe>
    with SingleTickerProviderStateMixin {
  late RiveAnimationController _controllerWalk;
  late ScrollController _scrollController;
  double _leftPositioned = -50;
  bool _isFirstTime = true;

  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _message;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controllerWalk = SimpleAnimation('walking', autoplay: true);
    _scrollController = ScrollController()..addListener(scrollListener);
    Future.delayed(const Duration(seconds: 3), () {
      if (_leftPositioned != -50) return;
      _leftPositioned = MediaQuery.of(context).size.width + 100;
      _isFirstTime = true;
      setState(() {});
    });
  }

  void scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _leftPositioned = MediaQuery.of(context).size.width + 100;
      _isFirstTime = true;
      setState(() {});
    }
    if (_scrollController.hasClients &&
        _scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      widget.pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controllerWalk.dispose();
    _scrollController.dispose();
  }

  Future<void> _sendEmail() async {
    try {
      if (!_formKey.currentState!.validate()) return;
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();
      await MailService.instance
          .sendEmail(name: _name!, email: _email!, message: _message!);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(TextContent.instance.successSend),
        backgroundColor: primaryColor,
      ));
    } catch (err) {
      debugPrint("SEND_EMAIL_ERROR: $err");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(TextContent.instance.errorSend),
        backgroundColor: alertColor,
      ));
    } finally {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeepAlivePage(
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 3),
            bottom: 0,
            left: _leftPositioned,
            onEnd: () {
              _leftPositioned = -50;
              _isFirstTime = false;
              setState(() {});
            },
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(_isFirstTime ? 0 : pi),
              child: SizedBox(
                width: 50,
                height: 50,
                child: RiveAnimation.asset(
                  'assets/rive/among_us.riv',
                  controllers: [_controllerWalk],
                  onInit: (_) => setState(() {}),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: spacing10),
                  Text(
                    TextContent.instance.contactMe,
                    style: ResponsiveBreakpoints.of(context)
                            .smallerOrEqualTo(TABLET)
                        ? Theme.of(context).textTheme.displayMedium
                        : Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: spacing5),
                  Container(
                    constraints:
                        const BoxConstraints(maxWidth: 100, maxHeight: 5),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: spacing5),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8),
                    child: Text(
                      TextContent.instance.contactMeDescription,
                      style: ResponsiveBreakpoints.of(context)
                              .smallerOrEqualTo(TABLET)
                          ? Theme.of(context).textTheme.titleMedium
                          : Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: spacing5),
                  const SocialNetworks(),
                  const SizedBox(height: spacing8),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: kCanvas6,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              label: Text(TextContent.instance.name),
                              hintText: TextContent.instance.nameHint,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return TextContent.instance.nameError;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => _name = value,
                          ),
                          const SizedBox(height: spacing5),
                          TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              label: Text(TextContent.instance.email),
                              hintText: TextContent.instance.emailHint,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return TextContent.instance.emailError;
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return TextContent.instance.emailError;
                              }
                              return null;
                            },
                            onSaved: (value) => _email = value,
                          ),
                          const SizedBox(height: spacing5),
                          TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              label: Text(TextContent.instance.message),
                              hintText: TextContent.instance.messageHint,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return TextContent.instance.messageError;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.done,
                            onSaved: (value) => _message = value,
                          ),
                          const SizedBox(height: spacing5),
                          _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : BaseButton(
                                  label: TextContent.instance.sendMessage,
                                  onTap: _sendEmail,
                                )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
