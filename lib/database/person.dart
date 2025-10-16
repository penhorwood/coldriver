import 'package:isar_community/isar.dart';
// ==================================================
import '/database/book.dart';
// ==================================================

// command:  dart run build_runner build --delete-conflicting-outputs

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
part 'person.g.dart';


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@collection
class Person {
	Id id;

	@Index(caseSensitive: false)
	final String? name;
	final List<Book>? books;

	// ==================================================
	Person({
		required this.name
		, List<Book>? books
	}) : id = Isar.autoIncrement
		, books = books ?? [];

	// ==================================================
	Person._xerox({
		  required this.id
		, required this.name
		, required this.books
	});

	// ==================================================
	Person copyWith({
		  String? name
		, List<Book>? books
	}){
		return Person._xerox(
			  id: id
			, name:  name  ?? this.name
			, books: books ?? this.books
		);
	}
}