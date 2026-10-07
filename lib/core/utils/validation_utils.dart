
String? validateEmail(String value, String errorMessage) {
  const allowed = 'abcdefghijklmnopqrstuvwxyz'
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
      '1234567890@_.';

  final String email = value.trim();

  if (value.split('').any(
        (char) => !allowed.contains(char)
  )) {
    return errorMessage;
  }

  final List<String> parts = email.split('@');

  if (parts.length != 2) {
    return errorMessage;
  }

  final String localPart = parts[0];
  final String domain = parts[1];

  if (localPart.isEmpty || domain.isEmpty) {
    return errorMessage;
  }

  if (!domain.contains('.')) {
    return errorMessage;
  }

  if (domain.startsWith('.') || domain.endsWith('.')) {
    return errorMessage;
  }

  return null;
}