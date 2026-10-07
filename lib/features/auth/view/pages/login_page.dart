
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/error/failure.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/auth/user_model.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/presentation/l10n/app_localizations.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/presentation/theme/app_palette.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/utils/show_snackbar.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/utils/validation_utils.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/view/pages/signup_page.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/view/widgets/expanded_filled_button_widget.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/view/widgets/text_form_field_widget.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/viewModel/auth_view_model.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/home/view/pages/home_page.dart';

class LoginPage extends ConsumerStatefulWidget {

  final bool? showSuccessMessage;
  const LoginPage(this.showSuccessMessage, {super.key});

  static MaterialPageRoute route([
    bool? showSuccessMessage = false
  ]) => MaterialPageRoute(
    builder: (BuildContext context) => LoginPage(showSuccessMessage),
  );

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _errorMessage = '';
  bool _isSignUpSuccessMessageShown = false;
  bool isAuthenticated = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final ThemeData appTheme = Theme.of(context);
    final AppPalette palette = appTheme.extension<AppPalette>()!;

    bool isLoading = (
        ref.watch(authViewModelProvider)?.isLoading == true
        || isAuthenticated
    );

    ref.listen(
      authViewModelProvider,
      (oldState, updatedState) {
        updatedState?.when(
            data: (r) {
              if (r.id.isEmpty) {return;}
              isAuthenticated = true;
              Navigator.pushReplacement(
                context,
                HomePage.route()
              );
            },
            error: (error, stackTrace) {
              error as Failure;

              switch (error.code) {
                case .invalidCredentials:
                  _errorMessage = l10n.onInvalidLogInCredentials;
                case .emailNotConfirmed:
                  _errorMessage = l10n.onEmailNotConfirmed;
                default:
                  showSnackBar(context, error.message, alignCenter: true);
              }
            },
            loading: () {}
        );
      }
    );


    return Scaffold(
      body: Center(
        child: isLoading ?
          CircularProgressIndicator() :
        SafeArea(
          child: Form(
            key: _formKey,
            autovalidateMode: .onUserInteractionIfError,
            child: SingleChildScrollView(
              child: Padding(
                padding: const .all(30),
                child: Column(
                  mainAxisAlignment: .center,
                  children: [



                    Text(
                      "${l10n.login}.",
                      style: appTheme.textTheme.headlineLarge!.copyWith(
                        color: appTheme.primaryColor
                      ),
                    ),
                    const SizedBox(height: 45),
                    if (widget.showSuccessMessage == true
                        && _errorMessage.isEmpty
                        && !_isSignUpSuccessMessageShown
                    )
                      Text(
                          l10n.onUserCreated,
                          style: appTheme.textTheme.bodyLarge!.copyWith(
                              color: palette.successColorDark
                          ),
                        textAlign: .center,
                      ),
                    const SizedBox(height: 45),
                    TextFormFieldWidget(
                        controller: _emailController,
                        title: l10n.emailFieldTitle,
                        hintText: l10n.emailFiendHint,
                        icon: Icons.alternate_email_rounded,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.fieldIsMissing;
                          }
                          return validateEmail(value, l10n.invalidEmail);
                        },
                    ),

                    TextFormFieldWidget(
                        controller: _passwordController,
                        title: l10n.passwordFieldTitle,
                        hintText: l10n.passwordFieldHint,
                        icon: Icons.password_rounded,
                        hiddenText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.fieldIsMissing;
                          }

                          if (value.length < UserModel.minPasswordLength) {
                            return l10n.passwordTooShort(UserModel.minPasswordLength);
                          }

                          return null;
                        },
                    ),
                    const SizedBox(height: 5),
                    if (_errorMessage.isNotEmpty)
                      Text(
                          _errorMessage,
                          style: appTheme.textTheme.bodyLarge!.copyWith(
                              color: palette.errorColor
                          ),
                        textAlign: .center,
                      ),
                    const SizedBox(height: 25),

                    ExpandedFilledButtonWidget(
                        onPressed: () async {
                          final bool isNotValid = !_formKey.currentState!.validate();
                          if (isNotValid) {
                            _isSignUpSuccessMessageShown = true;
                            return;
                          }
                          await ref.read(authViewModelProvider.notifier).logInUser(
                              email: _emailController.text,
                              password: _passwordController.text
                          );
                        },
                        child: Text(
                          l10n.login
                        ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            SignupPage.route()
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: '${l10n.noAccountYet} ',
                          style: appTheme.textTheme.bodyLarge!.copyWith(
                            color: palette.onSurfaceDarkColor
                          ),
                          children: [
                            TextSpan(
                              text: l10n.signup,
                              style: appTheme.textTheme.bodyLarge!.copyWith(
                                color: palette.themeColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),



                  ]
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
