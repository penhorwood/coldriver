// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Service)
const serviceProvider = ServiceProvider._();

final class ServiceProvider
    extends $AsyncNotifierProvider<Service, List<Person>> {
  const ServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serviceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serviceHash();

  @$internal
  @override
  Service create() => Service();
}

String _$serviceHash() => r'ef7f75614d7ab00d4ea4cb5daaf789b6e0ab286d';

abstract class _$Service extends $AsyncNotifier<List<Person>> {
  FutureOr<List<Person>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Person>>, List<Person>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Person>>, List<Person>>,
              AsyncValue<List<Person>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
