// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historyPage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getHistoriesHash() => r'd611021ee8b48f2cfcd10b3fb11c811d2d89b5d1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getHistories].
@ProviderFor(getHistories)
const getHistoriesProvider = GetHistoriesFamily();

/// See also [getHistories].
class GetHistoriesFamily extends Family<AsyncValue<List<History>>> {
  /// See also [getHistories].
  const GetHistoriesFamily();

  /// See also [getHistories].
  GetHistoriesProvider call(
    String collection,
  ) {
    return GetHistoriesProvider(
      collection,
    );
  }

  @override
  GetHistoriesProvider getProviderOverride(
    covariant GetHistoriesProvider provider,
  ) {
    return call(
      provider.collection,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getHistoriesProvider';
}

/// See also [getHistories].
class GetHistoriesProvider extends AutoDisposeFutureProvider<List<History>> {
  /// See also [getHistories].
  GetHistoriesProvider(
    String collection,
  ) : this._internal(
          (ref) => getHistories(
            ref as GetHistoriesRef,
            collection,
          ),
          from: getHistoriesProvider,
          name: r'getHistoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getHistoriesHash,
          dependencies: GetHistoriesFamily._dependencies,
          allTransitiveDependencies:
              GetHistoriesFamily._allTransitiveDependencies,
          collection: collection,
        );

  GetHistoriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collection,
  }) : super.internal();

  final String collection;

  @override
  Override overrideWith(
    FutureOr<List<History>> Function(GetHistoriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetHistoriesProvider._internal(
        (ref) => create(ref as GetHistoriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collection: collection,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<History>> createElement() {
    return _GetHistoriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetHistoriesProvider && other.collection == collection;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collection.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetHistoriesRef on AutoDisposeFutureProviderRef<List<History>> {
  /// The parameter `collection` of this provider.
  String get collection;
}

class _GetHistoriesProviderElement
    extends AutoDisposeFutureProviderElement<List<History>>
    with GetHistoriesRef {
  _GetHistoriesProviderElement(super.provider);

  @override
  String get collection => (origin as GetHistoriesProvider).collection;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
