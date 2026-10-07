enum ErrorCodeEnum {
  invalidCredentials,
  emailNotConfirmed,
  emailAlreadyExists;

  static ErrorCodeEnum? from(String? code) {
    return switch (code) {
      'invalid_credentials' => ErrorCodeEnum.invalidCredentials,
      'email_not_confirmed' => ErrorCodeEnum.emailNotConfirmed,
      _ => null,
    };
  }
}