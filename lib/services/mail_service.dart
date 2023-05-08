import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:richar/env.dart';

class MailService {
  //Create a singleton with factory
  static final MailService _singleton = MailService._internal();

  factory MailService() {
    return _singleton;
  }

  static MailService get instance => _singleton;

  MailService._internal();

  Future<void> sendEmail(
      {required String name,
      required String email,
      required String message}) async {
    try {

      final templateParams = {
        'from_name': name,
        'to_name': "Richar Cangui",
        'message': message,
        'reply_to': email,
      };

      await emailjs.EmailJS.send(
        Env.emailServiceId,
        Env.emailTemplateId,
        templateParams,
        const emailjs.Options(
          publicKey: Env.emailPublicKey,
          privateKey: Env.emailPrivateKey,
        ),
      );
    } catch (_) {
      rethrow;
    }
  }
}
