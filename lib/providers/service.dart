// ignore_for_file: file_names
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar_community/isar.dart';
// ==================================================
import '/database/person.dart';
import '/database/book.dart';
// ==================================================
import '/services/tracer.dart';
// ==================================================
import '/main.dart';
// ==================================================


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
part 'service.g.dart';

// build riverpod providers
// command:  dart run build_runner build --delete-conflicting-outputs
// command:  dart run build_runner watch

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@riverpod
class Service extends _$Service {

	// ==================================================
	@override
	Future<List<Person>> build() async {
		Tracer.marker('Service', 'build');
		Isar isar = ref.read(isarProvider);

		List<Person>? people = await isar.persons.where().findAll();

		return people;
	}

	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Future<void> loader() async {
		Tracer.marker( 'service', 'loader' );

		List<String> names = ['Sam','Dan','Randy','Jamie','Emma'];
		List<String> titles = ['Dune','Jaws','1984','Holes','Fahrenheit 451','Dracula','Macbeth'];

		for( String name in names ){
			List<Book> books = [];

			for( String title in titles ){
				books.add( Book.set( title: title ) );
			}

			Person person = Person( name: name, books: books );
			await savePerson( person );
		}
	}

	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Person findPerson( String name ) {
		Isar isar = ref.read(isarProvider);
		Person? person = isar.persons.where().nameEqualTo( name ).findFirstSync();
		return person ?? Person(name: 'unknown');
	}

	//===================================================
	Future<void> savePerson( Person person ) async {
		Tracer.marker( 'service', 'savePerson | ${person.name}' );
		Isar isar = ref.read(isarProvider);

		await isar.writeTxn(() async {
			await isar.persons.put( person );
		});
	}

}