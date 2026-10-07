
import 'package:flutter_mvvm_supabase_auth_flow/core/auth/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserNotifier extends _$CurrentUserNotifier {

  @override
  UserModel? build() => null;

  void setUser(UserModel user) {
    state = user;
  }

  void clearUser() {
    state = null;
  }

  bool get isAuthenticated => state != null && state!.id.isNotEmpty;
}

