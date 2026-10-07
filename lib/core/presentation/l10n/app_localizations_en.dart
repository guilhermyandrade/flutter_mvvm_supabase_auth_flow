// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get emailFieldTitle => 'Email';

  @override
  String get emailFiendHint => 'Your email here';

  @override
  String get passwordFieldTitle => 'Password';

  @override
  String get passwordFieldHint => 'Your password here';

  @override
  String get confirmPasswordFieldTitle => 'Confirm your password';

  @override
  String get login => 'Log In';

  @override
  String get signup => 'Sign Up';

  @override
  String get logOut => 'Log Out';

  @override
  String get noAccountYet => 'Don\'t have an account yet?';

  @override
  String get alreadyHaveAnAccount => 'Already have an account?';

  @override
  String get invalidEmail => 'Please enter a valid email.';

  @override
  String get fieldIsMissing => 'This field is missing!';

  @override
  String get incorrectPassword => 'Password is incorrect!';

  @override
  String get passwordDoesNotMatch => 'Your passwords are not matching!';

  @override
  String passwordTooShort(Object minLength) {
    return 'Must contain at least $minLength characters!';
  }

  @override
  String get onUserCreated =>
      'Account created successfully! Please log in to continue.';

  @override
  String get onInvalidEmail =>
      'This email address can\'t be used. Please try another one.';

  @override
  String get onEmailNotConfirmed =>
      'Please check your email and verify your account before logging in.';

  @override
  String get onInvalidLogInCredentials =>
      'Incorrect email or password. Please, try again.';

  @override
  String get userLoggedIn => 'You\'re logged in!';
}
