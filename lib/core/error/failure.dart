import 'package:flutter_mvvm_supabase_auth_flow/core/error/error_code_enum.dart';

class Failure {
  final ErrorCodeEnum? code;
  final String message;
  const Failure({
    this.message = "An unexpected error occurred.",
    this.code,
  });
}

