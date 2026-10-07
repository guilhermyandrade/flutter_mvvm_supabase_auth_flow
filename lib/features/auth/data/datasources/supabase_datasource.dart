import 'package:flutter_mvvm_supabase_auth_flow/core/error/exceptions.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/auth/user_model.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/providers/supabase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_datasource.g.dart';

@riverpod
SupabaseDatasource supabaseDatasource(Ref ref) {
  return SupabaseDatasource(
      ref.read(supabaseClientProvider)
  );
}


class SupabaseDatasource {
  final SupabaseClient supabaseClient;
  SupabaseDatasource(this.supabaseClient);

  Session? get currentSessionData => supabaseClient.auth.currentSession;

  Future<UserModel> getCurrentUserData() async {
    try {
      if (currentSessionData == null) {
        throw ServerException(message: 'User does not exist.');
      }
      final userData = await supabaseClient.from('profiles')
          .select('id, email')
          .eq('id', currentSessionData!.user.id);

      return UserModel.fromJson(userData.first);
    } catch (e) {
      throw ServerException(message: e.toString());
    }

  }
  
  Future<UserModel> logIn({
    required String email,
    required String password
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
          email: email,
          password: password
      );

      if (response.user == null) {
        throw ServerException(message: 'User is null!');
      }

      return UserModel(
          id: response.user!.id,
          email: response.user!.email!
      );
    } on AuthApiException catch (e) {
      throw ServerException(message: e.message, code: .from(e.code));
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }


  Future<UserModel> signUp({
    required String email,
    required String password
  }) async {
    try {

      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw ServerException(message: 'User is null!');
      }

      return UserModel(
          id: response.user!.id,
          email: response.user!.email!
      );
    } on AuthApiException catch (e) {
      throw ServerException(message: e.message, code: .from(e.code));
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<bool> isEmailRegistered({
    required String email
  }) async {
    try {
      final response = await supabaseClient.from('profiles')
          .select('email')
          .eq('email', email);

      if (response.isEmpty) {
        return false;
      }

      return true;

    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }


  Future<void> signOut() async {
    try {
      await supabaseClient.auth.signOut();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}