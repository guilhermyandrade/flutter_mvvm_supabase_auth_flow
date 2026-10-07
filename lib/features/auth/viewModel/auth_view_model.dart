import 'package:fpdart/fpdart.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/error/failure.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/auth/user_model.dart';
import 'package:flutter_mvvm_supabase_auth_flow/core/providers/current_user_provider.dart';
import 'package:flutter_mvvm_supabase_auth_flow/features/auth/data/repositories/auth_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {

  late AuthRemoteRepository _authRemoteRepository;
  late CurrentUserNotifier _currentUserNotifier;

  @override
  AsyncValue<UserModel>? build() {
    _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    _currentUserNotifier = ref.watch(currentUserProvider.notifier);
    return null;
  }

  void _onFailure(Failure l) {
    if (!ref.mounted) {return;}
    state = AsyncError(l, .current);
  }
  void _setCurrentUserData(UserModel user) {
    if (user.id.isNotEmpty) {
      _currentUserNotifier.setUser(user);
    }
    if (!ref.mounted) {return;}
    state = AsyncData(user);
  }

  Future<void> initializeAuthSession() async {
    // gets current session data and, in success, updates currentUserProvider.
    state = AsyncLoading();

    final res = await _authRemoteRepository.getCurrentUserData();

    switch (res) {
      case Left(value: final l): _onFailure(l);
      case Right(value: final user): _setCurrentUserData(user);
    }
  }

  Future<void> logInUser({
    required String email,
    required String password
  }) async {
    state = AsyncLoading();

    final res = await _authRemoteRepository.logIn(
      email: email, password: password
    );

    switch (res) {
      case Left(value: final l): _onFailure(l);
      case Right(value: final user): _setCurrentUserData(user);
    }
  }

  Future<void> signUpUser({
    required String email,
    required String password
  }) async {
    state = AsyncLoading();

    final res = await _authRemoteRepository.signUp(
        email: email, password: password
    );

    switch (res) {
      case Left(value: final l): _onFailure(l);
      case Right(value: final user): state = AsyncData(user);
    }
  }

  Future<void> signOut() async {
    state = AsyncLoading();

    final res = await _authRemoteRepository.signOut();

    switch (res) {
      case Left(value: final l): _onFailure(l);
      case Right(value: final _): state = AsyncData(UserModel(id: '', email: ''));
    }
  }
}