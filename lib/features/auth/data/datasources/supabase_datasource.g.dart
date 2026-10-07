// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(supabaseDatasource)
final supabaseDatasourceProvider = SupabaseDatasourceProvider._();

final class SupabaseDatasourceProvider
    extends
        $FunctionalProvider<
          SupabaseDatasource,
          SupabaseDatasource,
          SupabaseDatasource
        >
    with $Provider<SupabaseDatasource> {
  SupabaseDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseDatasourceHash();

  @$internal
  @override
  $ProviderElement<SupabaseDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseDatasource create(Ref ref) {
    return supabaseDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseDatasource>(value),
    );
  }
}

String _$supabaseDatasourceHash() =>
    r'18ffd6369929b0b8359f8d6a84d04808ad8bfcf0';
