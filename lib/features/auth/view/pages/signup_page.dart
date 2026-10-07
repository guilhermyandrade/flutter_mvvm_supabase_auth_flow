
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/error/failure.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/auth/user_model.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/presentation/l10n/app_localizations.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/presentation/theme/app_palette.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/utils/show_snackbar.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/utils/validation_utils.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/view/pages/login_page.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/view/widgets/expanded_filled_button_widget.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/view/widgets/text_form_field_widget.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/viewModel/auth_view_model.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  static MaterialPageRoute<void> route() => MaterialPageRoute(
    builder: (BuildContext context) => const SignupPage(),
  );

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _errorMessage = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final ThemeData appTheme = Theme.of(context);
    final AppPalette palette = appTheme.extension<AppPalette>()!;

    final bool isLoadingState = ref.watch(authViewModelProvider)?.isLoading == true;

    ref.listen(
        authViewModelProvider,
        (oldState, updatedState) {
          updatedState?.when(
              data: (r) {
                Navigator.pushReplacement(
                    context,
                    LoginPage.route(true)
                );
              },
              error: (error, stackTrace) {
                error as Failure;

                switch (error.code) {
                  case .emailAlreadyExists:
                    _errorMessage = l10n.onInvalidEmail;
                  default:
                    showSnackBar(context, error.message, alignCenter: true);
                }

              },
              loading: () {}
          );
        }
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.scaffoldBackgroundColor,
        foregroundColor: appTheme.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const .all(30),
          child:
          isLoadingState ?
            CircularProgressIndicator() :
          Form(
            key: formKey,
            autovalidateMode: .onUserInteractionIfError,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: .center,
                children: [



                  Text(
                    "${l10n.signup}.",
                    style: appTheme.textTheme.headlineLarge!.copyWith(
                      color: appTheme.primaryColor
                    ),
                  ),
                  const SizedBox(height: 90),
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

                  TextFormFieldWidget(
                    controller: _confirmPasswordController,
                    title: l10n.confirmPasswordFieldTitle,
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

                      if (_passwordController.text.length
                          != _confirmPasswordController.text.length ||
                        _passwordController.text.trim()
                          != _confirmPasswordController.text.trim()
                      ) {
                        return l10n.passwordDoesNotMatch;
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
                        final bool isNotValid = !formKey.currentState!.validate();
                        if (isNotValid) {return;}
                        await ref.read(authViewModelProvider.notifier).signUpUser(
                            email: _emailController.text,
                            password: _passwordController.text
                        );
                      },
                      child: Text(
                        l10n.signup
                      ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          LoginPage.route()
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: '${l10n.alreadyHaveAnAccount} ',
                        style: appTheme.textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: l10n.login,
                            style: TextStyle(
                              color: palette.themeColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),



                ]
              ),
            ),
          )
        ),
      ),
    );
  }
}
