import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/auth/auth_gate.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/presentation/l10n/app_localizations.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/presentation/theme/app_theme.dart';
import 'package:flutter_mvvm_supabase_auth_flow/init_app.dart';

void main() async {
  final container = await initApp();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Auth App',
      theme: AppTheme.lightThemeMode,
      home: const AuthGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}