abstract class Env {
  static const String sendGridUrl = String.fromEnvironment(
    'SENDGRID_URL',
    defaultValue: '',
  );

  static const String sendGridApi = String.fromEnvironment(
    'SENDGRID_API',
    defaultValue: '',
  );
}
