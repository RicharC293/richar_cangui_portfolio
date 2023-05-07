import 'package:dio/dio.dart';
import 'package:richar_cangui/env.dart';

class MailService {
  //Create a singleton with factory
  static final MailService _singleton = MailService._internal();
  factory MailService() {
    return _singleton;
  }

  static MailService get instance => _singleton;

  MailService._internal();

  final _baseUrl = Env.sendGridUrl;

  final _auth = 'Bearer ${Env.sendGridApi}';

  final _destinationEmail = 'contactos@richarcangui.com';

  Future<void> sendEmail(
      {required String name,
      required String email,
      required String message}) async {
    try {
      final data = {
        "personalizations": [
          {
            "to": [
              {"email": _destinationEmail}
            ],
            "subject": "Contact from web page"
          }
        ],
        "content": [
          {"type": "text/plain", "value": message}
        ],
        "from": {"email": email, "name": name},
      };
      await Dio(BaseOptions(headers: {
        'Authorization': _auth,
        'Content-Type': 'application/json'
      })).post(_baseUrl, data: data);
    } catch (_) {
      rethrow;
    }
  }
}
