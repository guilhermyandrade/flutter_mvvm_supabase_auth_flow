import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/providers/current_user_provider.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/view/pages/login_page.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/home/view/pages/home_page.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.read(currentUserProvider.notifier);

    return currentUser.isAuthenticated ?
          const HomePage() :
          const LoginPage(null);
  }
}