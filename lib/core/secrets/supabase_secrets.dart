class SupabaseSecrets {
  static const String supabaseURL = .fromEnvironment('SUPABASE_URL');
  static const String publishableKey = .fromEnvironment('SUPABASE_PUBLISHABLE_KEY');
}