// ignore_for_file: non_constant_identifier_names

import 'package:riverpod_annotation/riverpod_annotation.dart';
// ==================================================
import '/database/person.dart';
import '/providers/service.dart';
import '/services/tracer.dart';
// ==================================================


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
part 'current.g.dart';

// build riverpod providers
// command:  dart run build_runner build --delete-conflicting-outputs
// command:  dart run build_runner watch

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@Riverpod(keepAlive: true)
class Current extends _$Current {
	String name = '';

	//===================================================
	@override
	Person build() {
		Tracer.marker('Current', 'build');
		Person person = ref.read(serviceProvider.notifier).findPerson( name );
		return person;
	}

	//===================================================
	void setCurrent( String? tag ) {
		Tracer.marker('Current', 'setCurrent | $tag');

		if( tag != null ){
			name = tag;
			ref.invalidateSelf();
		}
	}
}