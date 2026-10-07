
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/auth/user_model.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/presentation/l10n/app_localizations.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/providers/current_user_provider.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/view/pages/login_page.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/viewModel/auth_view_model.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static MaterialPageRoute route() => MaterialPageRoute(
      builder: (context) => HomePage()
  );

  @override
  ConsumerState<HomePage> createState() => _ListManagementPageState();
}

class _ListManagementPageState extends ConsumerState<HomePage> {

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final UserModel? user = ref.read(currentUserProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          spacing: 15,
          mainAxisAlignment: .center,
          children: [
            Text('ID: ${user?.id}'),
            Text('Email: ${user?.email}'),
            const SizedBox(height: 25,),

            Text(l10n.userLoggedIn),
            
            FilledButton(
                onPressed: () {
                  ref.watch(authViewModelProvider.notifier).signOut();
                  Navigator.pushReplacement(
                      context,
                      LoginPage.route()
                  );
                },
                child: Text(l10n.logOut)
            )

          ],
        ),
      ),
    );
  }
}
