// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Current)
const currentProvider = CurrentProvider._();

final class CurrentProvider extends $NotifierProvider<Current, Person> {
  const CurrentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentHash();

  @$internal
  @override
  Current create() => Current();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Person value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Person>(value),
    );
  }
}

String _$currentHash() => r'4b918be9532a18cd32936bf3c53ffe8ad72f2406';

abstract class _$Current extends $Notifier<Person> {
  Person build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Person, Person>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Person, Person>,
              Person,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
