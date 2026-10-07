part of 'init_app.dart';

Future<ProviderContainer> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SupabaseSecrets.supabaseURL,
    publishableKey: SupabaseSecrets.publishableKey
  );

  final ProviderContainer container = ProviderContainer();
  // updating currentUserProvider when app is started
  await container.read(authViewModelProvider.notifier).initializeAuthSession();
  return container;
}