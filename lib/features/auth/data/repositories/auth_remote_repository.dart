import 'package:fpdart/fpdart.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/error/exceptions.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/error/failure.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/auth/user_model.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/data/datasources/supabase_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(Ref ref) {
  return AuthRemoteRepository(
      ref.read(supabaseDatasourceProvider)
  );
}

class AuthRemoteRepository {
  final SupabaseDatasource datasource;
  AuthRemoteRepository(this.datasource);

  Future<Either<Failure, UserModel>> getCurrentUserData() async {
    try {
      return right(
        await datasource.getCurrentUserData()
      );
    } on ServerException catch (e) {
      return left(Failure(message: e.message, code: e.code));
    }
  }

  Future<Either<Failure, UserModel>> logIn({
    required String email,
    required String password
  }) async {
    try {
      return right(
        await datasource.logIn(email: email, password: password)
      );
    } on ServerException catch (e) {
      return left(Failure(message: e.message, code: e.code));
    }
  }
  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password
  }) async {
    try {

      if (await datasource.isEmailRegistered(email: email)) {
        return left(Failure(
            message: 'Invalid email.',
            code: .emailAlreadyExists
        ));
      }

      return right(
        await datasource.signUp(email: email, password: password)
      );
    } on ServerException catch (e) {
      return left(Failure(message: e.message, code: e.code));
    }
  }

  Future<Either<Failure, void>> signOut() async {
    try {
      await datasource.signOut();
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(message: e.message, code: e.code));
    }
  }
}