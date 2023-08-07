class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'Someone else are using this e-mail address',
    'OPERATION_NOT_ALLOWED': 'You are not allowed',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'You are block, try later',
    'EMAIL_NOT_FOUND': 'You are not registerd',
    'INVALID_PASSWORD': 'Your password is incorrect',
    'USER_DISABLED': 'You are disable for now',
  };

  final String key;

  AuthException({required this.key});

  @override
  String toString() {
    return errors[key] ?? 'Authentication failed';
  }
}
