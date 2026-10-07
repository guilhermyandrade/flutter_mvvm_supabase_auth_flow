// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get emailFieldTitle => 'E-mail';

  @override
  String get emailFiendHint => 'Seu e-mail aqui';

  @override
  String get passwordFieldTitle => 'Senha';

  @override
  String get passwordFieldHint => 'Sua senha aqui';

  @override
  String get confirmPasswordFieldTitle => 'Confirme sua senha';

  @override
  String get login => 'Entrar';

  @override
  String get signup => 'Cadastre-se';

  @override
  String get logOut => 'Sair';

  @override
  String get noAccountYet => 'Ainda não tem uma conta?';

  @override
  String get alreadyHaveAnAccount => 'Já tem uma conta?';

  @override
  String get invalidEmail => 'Por favor, insira um e-mail válido.';

  @override
  String get fieldIsMissing => 'Este campo está faltando!';

  @override
  String get incorrectPassword => 'Senha incorreta!';

  @override
  String get passwordDoesNotMatch => 'As senhas não coincidem!';

  @override
  String passwordTooShort(Object minLength) {
    return 'Deve conter pelo menos $minLength caracteres!';
  }

  @override
  String get onUserCreated =>
      'Conta criada com sucesso! Por favor, faça login para continuar.';

  @override
  String get onInvalidEmail =>
      'Este endereço de e-mail não pode ser usado. Por favor, tente outro.';

  @override
  String get onEmailNotConfirmed =>
      'Por favor, verifique seu e-mail e confirme sua conta antes de fazer login.';

  @override
  String get onInvalidLogInCredentials =>
      'E-mail ou senha incorretos. Por favor, tente novamente.';

  @override
  String get userLoggedIn => 'Você está logado!';
}
