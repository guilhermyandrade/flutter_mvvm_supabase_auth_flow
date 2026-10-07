import 'package:flutter_mvvm_supabase_auth_flow/core/error/error_code_enum.dart';

class LocalException implements Exception {
  final String message;
  final ErrorCodeEnum? code;
  const LocalException({required this.message, this.code});
}

class ServerException implements Exception {
  final String message;
  final ErrorCodeEnum? code;
  const ServerException({required this.message, this.code});
}