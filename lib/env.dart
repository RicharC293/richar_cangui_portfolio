abstract class Env {
  static const String emailServiceId = String.fromEnvironment(
    'EMAIL_SERVICE_ID',
    defaultValue: '',
  );
  static const String emailTemplateId = String.fromEnvironment(
    'EMAIL_TEMPLATE_ID',
    defaultValue: '',
  );
  static const String emailPublicKey = String.fromEnvironment(
    'EMAIL_PUBLIC_KEY',
    defaultValue: '',
  );

  static const String emailPrivateKey = String.fromEnvironment(
    'EMAIL_PRIVATE_KEY',
    defaultValue: '',
  );
}
